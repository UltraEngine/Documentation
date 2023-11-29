# AnimationStats #

This class contains information about the animation threads. To enable statistics recording, you must call the [World.RecordStats](World_RecordStats.md) method.

| Property | Type | Description |
| --- | --- | --- |
| bones | int | Number of bones updated in the previous frame. |
| skeletons | int | Number of skeletons updated in the previous frame. |
| threads | int | Number of animation threads currently in use. |
| time | int | Combined time taken to update animations, in milliseconds. |

## Example ##

```csharp
using UnityEngine;

public class AnimationStats
{
    public int bones; // Number of bones updated in the previous frame.
    public int skeletons; // Number of skeletons updated in the previous frame.
    public int threads; // Number of animation threads currently in use.
    public int time; // Combined time taken to update animations, in milliseconds.
}
```