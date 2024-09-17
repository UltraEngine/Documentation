# World::SetShadowQuality

- void **SetShadowQuality**(const int quality)

| Parameter | Description |
|---|---|
| quality | this setting will scale the shadow resolution of all lights in the world, and decrease their depth offsets accordingly. The table below shows the suggested values that are used in the editor. |

Lights use a 1024 x 1024 shadow map size by default, so if a quality setting of 2 is used, the default shadow map size is increased to 4096 x 4096.

| Quality | Scale | Description |
|---|---|---|
| -1 | 50% | Low |
| 0 | 100% | Medium |
| 1 | 200% | High |
| 2 | 400% | Very high |
| 3 | 800% | Ultra |
