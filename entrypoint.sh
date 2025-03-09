#!/bin/bash
set -e

echo "Starting Ollama server in background..."
# Start the Ollama API server in background and capture its PID
ollama serve &
SERVER_PID=$!

# Wait for the server to become ready (adjust sleep duration as needed)
sleep 5

echo "Pulling deepseek-r1 model..."
ollama pull deepseek-r1:1.5b

echo "Running deepseek-r1 model..."
ollama run deepseek-r1:1.5b

# Wait on the server process so the container stays running
wait $SERVER_PID
