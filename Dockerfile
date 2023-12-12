FROM ghcr.io/ai-dock/comfyui:pytorch-2.1.1-py3.10-cuda-12.1.0-base-22.04

RUN apt-get update && apt-get install -y \
  curl \
  jq

RUN  wget https://raw.githubusercontent.com/SaladTechnologies/stable-diffusion-configurator/main/configure && chmod +x configure

COPY load-models-and-start .

ENV HOST='[::]'
ENV PORT=8188
ENV WEB_ENABLE_AUTH=false

CMD ["./load-models-and-start"]