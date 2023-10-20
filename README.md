# comfyui-dynamic
A ComfyUI container wrapped in an entrypoint script that allows preloading of models via environment variables

## API

The comfy api is strange and largely undocumented. This [article](https://medium.com/@yushantripleseven/comfyui-using-the-api-261293aa055a) gives a good example of how to use it.

```bash
./generate workflow_api.json
```

## Build

```bash
docker buildx build \
--platform linux/amd64 \
--output type=docker \
-t saladtechnologies/comfyui:dynamic \
.
```

## Run

```bash
docker compose up
```

## Environment Variables
| Variable | Description | Default |
| -------- | ----------- | ------- |
| CIVITAI_MODEL_VERSION_IDS | A comma-separated list of model version IDs to download. ex `128713` for just [Dreamshaper 8](https://civitai.com/models/4384?modelVersionId=128713) or `128713,166808` for Dreamshaper and [Arterior](https://civitai.com/models/112229/arterior-digital-art-style). This supports Checkpoints, VAEs, and Controlnets. The rightmost checkpoint value will be the default checkpoint when the server starts, and the rightmost vae value will be the default vae when the server starts. | None |
| LOAD_REFINER | If set to `1`, the SDXL refiner model will be downloaded. | 0 |