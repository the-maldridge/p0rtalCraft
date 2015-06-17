#!/bin/sh
tmux new-session -s minecraft -d 'htop'

# BUNGEECORD ROOT
echo "Starting Core BungeeCord Services"
# start the bungeecord core server
tmux new-window -t minecraft:1 -n 'BungeeCord' 'cd bungeeCord; ./start.sh; bash'

# lobby
echo "Starting Core BungeeCord Lobby"
tmux new-window -t minecraft:2 -n 'BungeeCordLobby' 'cd backend/lobby; ./start.sh; bash'

# BUNGEECORD BACKENDS
{% for server in servers %}

# {{ server.instanceDir }}
echo "Starting {{ server.instanceDir }}"
tmux new-window -t minecraft -n '{{ server.instanceDir }}' 'cd backend/{{ server.instanceDir }}; ./start.sh; bash'

# LAUNCH COMPLETE
# attatch to the bungeecord session
echo "Startup complete, connecting to BungeeCord Root"
tmux select-window -t minecraft:1
tmux -2 attach-session -t minecraft

