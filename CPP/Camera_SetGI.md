# Camera::SetGI

## Syntax

- void **SetGI**(const bool mode, const int resolution = 64, const float scale = 0.125, const int cascades = 3, const int bounces = 1)

| Parameter | Description |
|---|---|
| mode | global illumination mode |
| resolution | voxel grid resolution, can be 32, 64, 128, 256, or 512 |
| scale | size of one voxel |
| cascades | number of stages, can be 1, 2, 3, or 4 |
| bounces | number of light bounces, can be 1 or 2 |

## Remarks

Global illumination is a computationally expensive process and can drastically decrease rendering performance depending on the settings supplied. The default settings will provide good performance on most graphics cards.

Resolution values higher than the default can exceed hardware memory limits and should be used with caution.
