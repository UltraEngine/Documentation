# CreateSpeaker

This function creates a new speaker object.

Syntax
```lua
function CreateSpeaker(sound:Sound): Speaker
```

Parameter
- sound: (optional) sound to set
  - Type: Sound

Returns
- A new speaker.
  - Type: Speaker

Example
```lua
window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER)

sound = LoadSound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav")

speaker = CreateSpeaker(sound)

while not (window:Closed() or window:KeyDown(KEY_ESCAPE)) do
    if window:KeyHit(KEY_SPACE) then
        speaker:Play()
    end
    Sleep(16)
end

```