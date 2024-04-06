"""
ASGI config for nexusapp project.

It exposes the ASGI callable as a module-level variable named **`application`**.

For more information on this file, see
here
"""

import os
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application
from channels.security.websocket import AllowedHostsOriginValidator
from channels.auth import AuthMiddlewareStack

from chat.routing import websocket_urlpatterns
from django.conf import settings
from . import settings

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "nexusapp.settings")

django_asgi_app = get_asgi_application()

# Get the local IP address from settings dynamically
local_ip = settings.get_local_ip()

# Set allowed hosts dynamically
settings.ALLOWED_HOSTS = [local_ip, 'localhost', '127.0.0.1']

application = ProtocolTypeRouter({
    "http": django_asgi_app,
    "websocket": AllowedHostsOriginValidator(
        AuthMiddlewareStack(URLRouter(websocket_urlpatterns))
    )
})
