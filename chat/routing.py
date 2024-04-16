from django.urls import re_path
from . import consumers

websocket_urlpatterns = [
    # Change the regular expression pattern to allow any character (including white spaces)
    re_path(r'ws/chat/(?P<channel_name>\w+)/(?P<subchannel_name>.+)/$', consumers.ChatConsumer.as_asgi()),
]


