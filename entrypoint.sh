#!/bin/sh

if [ -d "$HOME/venv" ]; then
  source "$HOME/venv/bin/activate"
fi
exec "$@"
