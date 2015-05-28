#!/bin/sh
tmux new-session -d -s minecraft

# htop, useful to monitor host
tmux new-window -t minecraft:0 -n 'htop' 'htop'

# BUNGEECORD ROOT
echo "Starting Core BungeeCord Services"
# start the bungeecord core server
tmux new-window -t minecraft:1 -n 'BungeeCord' 'cd bungeeCord; ./start.sh; bash'

# lobby
echo "Starting Core BungeeCord Lobby"
tmux new-window -t minecraft:2 -n 'BungeeCordLobby' 'cd backend/lobby; ./start.sh; bash'

# BUNGEECORD BACKENDS
# survival
echo "Starting Survival"
tmux new-window -t minecraft:3 -n 'Survival' 'cd backend/survival; ./start.sh; bash'

# creative
echo "Starting Creative"
tmux new-window -t minecraft:4 -n 'Creative' 'cd backend/creative; ./start.sh; bash'

# LAUNCH COMPLETE
# attatch to the bungeecord session
echo "Startup complete, connecting to BungeeCord Root"
tmux select-window -t minecraft:1
tmux -2 attach-session -t minecraft

