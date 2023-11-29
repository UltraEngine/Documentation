# Sound

Base class: [Asset](Asset.md)

A sound file stores a waveform that can be used to play noises.

| Property | Type | Description |
|---|---|---|
| [GetHandle](Sound_GetHandle.md) | Method | returns the OpenAL albuffer for this sound |
| [GetLength](Sound_GetLength.md) | Method | returns the length of the sound, in seconds |
| [Play](Sound_Play.md) | Method | plays the sound once |
| [LoadSound](LoadSound.md) | Function | loads a sound from a file or stream |

**Syntax**

```csharp
public class Sound : Asset
{
    public int GetHandle();
    public float GetLength();
    public void Play();
    public static Sound LoadSound(string fileOrStream);
}
```

**Example**

```csharp
Sound sound = Sound.LoadSound("sound.wav");
sound.Play();
```