# World::SetShadowQuality

- void **SetShadowQuality**(const int quality)

| Parameter | Description |
|---|---|
| quality | this setting will scale the shadow resolution of all lights in the world, and decrease their depth offsets accordingly. The table below shows the suggested values that are used in the editor. |

Lights use a 1024x1024 shadow map by default, so if a quality setting of 2 is used, a 4096x4096 shadow map will be created.

| Quality | Scale | Description |
|---|---|---|
| -1 | 50% | Low |
| 0 | 100% | Medium |
| 1 | 200% | High |
| 2 | 400% | Very high |
| 3 | 800% | Ultra |
