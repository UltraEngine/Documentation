# Timer

Base class: [Object](Object.md)

A timer object emits a TIMERTICK event at a regular frequency. This is provides a method of updating an event-driven application in real-time while maintaining minimal CPU usage.

| Property | Type | Description |
| --- | --- | --- |
| [Stop](Timer_Stop.md) | Method | stops the timer |
| [CreateTimer](CreateTimer.md) | Function | creates a new timer object |

## Syntax

### C#

```csharp
public class Timer : Object
{
    public void Stop()
    {
        // Stops the timer
    }

    public static Timer CreateTimer()
    {
        // Creates a new timer object
        return new Timer();
    }
}
```

## Example

### C#

```csharp
// Create a new timer
Timer timer = Timer.CreateTimer();

// Stop the timer
timer.Stop();
```