# comfyui-dynamic
A ComfyUI container wrapped in an entrypoint script that allows preloading of models via environment variables. We are using https://github.com/ai-dock/comfyui/ as the base image.

You can use the prebuilt docker image at
```
saladtechnologies/comfyui:dynamic
```

## API

The comfy api is strange and largely undocumented. This [article](https://medium.com/@yushantripleseven/comfyui-using-the-api-261293aa055a) gives a good example of how to use it. [Here](./workflow_api.json) is an example text2img payload. Check out the [generate](./generate) script for an example of how to use Comfy progrematically.

```bash
./generate workflow_api.json
```

## Build

```bash
docker buildx build \
--platform linux/amd64 \
--output type=docker \
--provenance false \
-t saladtechnologies/comfyui:dynamic \
.
```

## Build Image With Models Baked In

```bash
docker buildx build \
-f Dockerfile.baked \
--platform linux/amd64 \
--output type=docker \
--provenance false \
-t saladtechnologies/comfyui:baked \
.
```

## Run

```bash
docker compose up
```

## Environment Variables
| Variable | Description | Default |
| -------- | ----------- | ------- |
| IP | The IP to run the ComfyUI server on. Use `[::]` on salad. | `0.0.0.0` |
| COMFYUI_PORT | The port to run the ComfyUI server on. Make sure the network port you enable when making your container group matches this value. | 8188 |
| CIVITAI_MODEL_VERSION_IDS | A comma-separated list of model version IDs to download. ex `128713` for just [Dreamshaper 8](https://civitai.com/models/4384?modelVersionId=128713) or `128713,166808` for Dreamshaper and [Arterior](https://civitai.com/models/112229/arterior-digital-art-style). This supports Checkpoints, VAEs, and Controlnets. The rightmost checkpoint value will be the default checkpoint when the server starts, and the rightmost vae value will be the default vae when the server starts. | None |
| LOAD_REFINER | If set to `1`, the SDXL refiner model will be downloaded. | 0 |
| WEB_ENABLE_AUTH | If set to `true`, the ComfyUI server will require a login. | true |