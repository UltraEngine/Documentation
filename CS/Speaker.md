# Speaker

**Base class:** [Object](Object.md)

This class provides an interface to control the way a sound behaves when played.

| Property | Type | Description |
| --- | --- | --- |
| [GetHandle](Speaker_GetHandle.md) | Method | returns the OpenAL alsource for the speaker |
| [GetPitch](Speaker_GetPitch.md) | Method | gets the speaker pitch |
| [GetState](Speaker_GetState.md) | Method | gets the speaker state |
| [GetTime](Speaker_GetTime.md) | Method | gets the current speaker sound time |
| [GetVolume](Speaker_GetVolume.md) | Method | gets the speaker volume |
| [Pause](Speaker_Pause.md) | Method | pauses the speaker |
| [Play](Speaker_Play.md) | Method | plays or resumes the speaker |
| [SetLooping](Speaker_SetLooping.md) | Method | set the speaker loop mode |
| [SetPitch](Speaker_SetPitch.md) | Method | sets the speaker pitch |
| [SetTime](Speaker_SetTime.md) | Method | jumps to the specified sound time |
| [SetFilter](Speaker_SetFilter.md) | Method | adds an audio filter |
| [SetVolume](Speaker_SetVolume.md) | Method | sets the speaker volume |
| [Stop](Speaker_Stop.md) | Method | stops the speaker |
| [CreateSpeaker](CreateSpeaker.md) | Function | creates a new speaker object |

**C# Syntax**

```csharp
public class Speaker : Object
{
    public IntPtr GetHandle();
    public float GetPitch();
    public int GetState();
    public float GetTime();
    public float GetVolume();
    public void Pause();
    public void Play();
    public void SetLooping(bool looping);
    public void SetPitch(float pitch);
    public void SetTime(float time);
    public void SetFilter(Filter filter);
    public void SetVolume(float volume);
    public void Stop();
}

public static class AudioManager
{
    public static Speaker CreateSpeaker();
}
```