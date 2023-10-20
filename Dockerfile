FROM ghcr.io/ai-dock/comfyui:pytorch-2.0.1-py3.10-cuda-11.8.0-base-22.04

RUN apt-get update && apt-get install -y \
  curl \
  jq

COPY load-models-and-start .

ENV HOST='0.0.0.0'
ENV PORT=8188

CMD ["./load-models-and-start"]