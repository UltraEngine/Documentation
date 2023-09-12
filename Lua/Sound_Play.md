# Sound:Play

This method plays a sound once and returns a speaker object.

```lua
function Sound:Play() end
```

## Returns

**Returns:** Speaker - Returns a new speaker object that can be used to control the sound.

## Example

```lua
-- Load sound
local sound = LoadSound("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Sound/notification.wav")
sound:Play()

while window:Closed() == false and window:KeyDown(KEY_ESCAPE) == false do
    -- Play sound when space key is pressed
    if window:KeyHit(KEY_SPACE) then
        sound:Play()
    end
    Sleep(16)
end
```