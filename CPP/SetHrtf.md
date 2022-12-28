# SetHrtf

This function enables or disables head-related transfer function audio processing.

## Syntax

- bool **SetHrtf**(const bool mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable or false to disable |

## Returns

Returns true if the mode is successfully set, otherwise false is returned.

## Remarks

HRTF audio is designed for use with headphones. This should be disabled when using speakers.

HRTF is disabled by default.
