# PostEffect

**Base class:** [Asset](Asset.md)

This class handles fullscreen post-porcessing shader effects.

| Property | Type | Description |
|---|---|---|
| [LoadPostEffect](LoadPostEffect.md) | Function | loads a post-processing effect from a JSON file |

### JSON Format

A post effect file specifies one or more shader passes. For each subpass, a texture buffer is allocated automatically and the results of one subpass are used as the input image for the next one.

```json
{
    "postEffect":
    {
        "subpasses":
        [
            {
                "shader":
                {
                    "vertex": "Shaders/PostEffects/PostEffect.vert.spv",
                    "fragment": "Shaders/PostEffects/Grayscale.frag.spv"
                }
            }
        ]
    }
}
```

You can specify sized texture buffers and render to those instead of to a texture buffer of the same size. This is useful for effects that involve downsampling an image. The texture buffer dimensions are specified as a fraction of the current framebuffer size. The "target" value specifies which texture buffer to render to at each step. Screen-space ambient occlusion is a relatively expensive procedure, so this post effect renders the effect into a half-size buffer, then renders a second pass at full resolution with a denoiser filter to clean up the final image:

```json
{
    "postEffect":
    {
        "buffers":
        [
            {
                "size": [0.5, 0.5]
            }         
        ],
        "subpasses":
        [
            {
                "target": 0,
                "shader":
                {
                    "vertex": "Shaders/PostEffects/PostEffect.vert.spv",
                    "fragment": "Shaders/PostEffects/SSAO.frag.spv"
                }
            },
            {
                "shader":
                {
                    "vertex": "Shaders/PostEffects/PostEffect.vert.spv",
                    "fragment": "Shaders/PostEffects/SSAODenoiser.frag.spv"
                }
            }                            
        ]
    }
}
```
