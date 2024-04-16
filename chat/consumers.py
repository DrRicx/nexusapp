from channels.generic.websocket import AsyncWebsocketConsumer
from django.contrib.sessions.backends.db import SessionStore
from django.conf import settings
from channels.db import database_sync_to_async
from django.db import close_old_connections
import json


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        # Close old database connections to prevent usage outside of async context
        close_old_connections()

        # Join room group
        self.sub_channel_name = self.scope["url_route"]["kwargs"]["subchannel_name"]

        self.room_group_name = f"_{self.sub_channel_name}"

        # Add the WebSocket connection to the room group
        await self.channel_layer.group_add(self.room_group_name, self.channel_name)

        # Accept the WebSocket connection
        await self.accept()

    async def disconnect(self, close_code):
        if hasattr(self, 'room_group_name'):
            # Leave room group if room_group_name is initialized
            await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

        if hasattr(self, 'session_key'):
            # Clean up session key
            await self.delete_session_key()

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json.get("message")
        username = text_data_json.get("username")
        recipient = text_data_json.get("recipient")

        if message is not None and username is not None:
            if recipient:
                await self.send_one_to_one_message(recipient, message, username)
            else:
                await self.send_one_to_group_message(message, username)

    async def send_one_to_group_message(self, message, username):
        await self.channel_layer.group_send(
            self.room_group_name, {
                "type": "chat.message",
                "message": message,
                "username": username,
            }
        )

    async def send_one_to_one_message(self, recipient, message, username):
        recipient_channel_name = await self.get_recipient_channel_name(recipient)
        if recipient_channel_name:
            await self.channel_layer.send(
                recipient_channel_name, {
                    "type": "chat.message",
                    "message": message,
                    "username": username,
                }
            )
        else:
            # Handle case where recipient is not found (offline, etc.)
            pass

    async def get_recipient_channel_name(self, recipient):
        # Logic to retrieve recipient's channel name (e.g., from a database)
        # This is a placeholder and should be replaced with your actual implementation
        return None  # Placeholder; replace with actual logic

    async def chat_message(self, event):
        message = event["message"]
        username = event["username"]
        await self.send(text_data=json.dumps(
            {"message": message,
             "username": username}
        ))

    @database_sync_to_async
    def get_user_id(self):
        if self.scope["user"].is_authenticated:
            return self.scope["user"].id
        else:
            return None