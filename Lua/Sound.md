# Sound

Base class: [Asset](Asset.md)

A sound file stores a waveform that can be used to play noises.

| Property | Type | Description |
|---|---|---|
| [GetHandle](#sound:handle) | Method | returns the OpenAL albuffer for this sound |
| [GetLength](#sound:length) | Method | returns the length of the sound, in seconds |
| [Play](#sound:play) | Method | plays the sound once |
| [LoadSound](#loadsound) | Function | loads a sound from a file or stream |

## Methods

### GetHandle()

returns the OpenAL albuffer for this sound

```lua
function Sound:GetHandle()
    -- code here
end
```

### GetLength()

returns the length of the sound, in seconds

```lua
function Sound:GetLength()
    -- code here
end
```

### Play()

plays the sound once

```lua
function Sound:Play()
    -- code here
end
```

## Functions

### LoadSound()

loads a sound from a file or stream

```lua
function LoadSound()
    -- code here
end
```