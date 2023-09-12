### Speaker:SetVolume

This method sets the speaker volume.

#### Syntax

```lua
function Speaker:SetVolume(volume)
```

##### Parameters

| Parameter | Description |
|---|---|
| volume | Volume scale relative to 1.0 |

#### Example

```lua
-- Create a new speaker object
local speaker = Speaker()

-- Set the volume to 0.8
speaker:SetVolume(0.8)
```