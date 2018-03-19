#!/bin/sh

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/venv" ]; then
  source "$HOME/venv/bin/activate"
fi

exec "$@"
