# Speaker:GetState

This method gets the speaker state.

## Syntax

- `state = Speaker:GetState()`

## Returns

Returns `SPEAKER_PLAYING`, `SPEAKER_STOPPED`, or `SPEAKER_PAUSED`.

## Example

```lua
-- Create a new speaker object
local speaker = Speaker()

-- Get the current state of the speaker
local state = speaker:GetState()

-- Print the state
print("Speaker state:", state)
```