# Probe::SetFadeDistance

This method sets the probe volume edge fade. This can be used to make specified edges of the probe fade in more gradually.

## Syntax

- void **SetFadeDistance**(const float distance, const CubemapFace face)

| Parameter | Description |
|---|---|
| distance | fade distance |
| face | cubemap face, can be CUBEMAP_POSITIVE_X, CUBEMAP_NEGATIVE_X, CUBEMAP_POSITIVE_Y, CUBEMAP_NEGATIVE_Y, CUBEMAP_POSITIVE_Z, or CUBEMAP_NEGATIVE_Z |
