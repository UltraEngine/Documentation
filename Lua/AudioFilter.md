# AudioFilter

Base class: [Asset](Asset.md)

This class manages sound effects that can be applied to a [speaker](Speaker.md).

| Property | Type | Description |
|---|---|---|
| [LoadAudioFilter](#loadaudiofilter) | Function | loads an audio filter from a file |

## LoadAudioFilter

```lua
function LoadAudioFilter(filePath: string): AudioFilter
```

loads an audio filter from a file

### Parameters:
- `filePath` (string): the path to the audio filter file

### Returns:
- `AudioFilter`: the loaded audio filter