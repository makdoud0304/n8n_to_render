FROM n8nio/n8n:latest

# Render attend un service HTTP sur le port $PORT (=10000)
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=10000
EXPOSE 10000
