#!/usr/bin/env bash

export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# Variables to get Sway to use Vulkan and not cause any screen flickering
# that happens with the OpenGL renderer.
export WLR_RENDERER=vulkan
export WLR_NO_HARDWARE_CURSORS=1
export XWAYLAND_NO_GLAMOR=1

# Start Sway with unsupported GPU option for it to work with Nvidia.
exec sway --unsupported-gpu
