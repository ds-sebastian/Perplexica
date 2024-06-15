#!/bin/sh

# Create config.toml with environment variables
cat <<EOF > /home/perplexica/config.toml
[GENERAL]
PORT = 3001
SIMILARITY_MEASURE = "${SIMILARITY_MEASURE}"

[API_KEYS]
OPENAI = "${OPENAI}"
GROQ = "${GROQ}"

[API_ENDPOINTS]
SEARXNG = "${SEARXNG_API_URL}"
OLLAMA = "${OLLAMA_API_URL}"
EOF

# Start backend
cd /home/perplexica && PORT=3001 yarn start &

# Start frontend
cd /home/perplexica/ui && PORT=3000 yarn start

