# Mutex

**Base class**: [Object](Object.md)

A mutex ("mutually exclusive") is used to define a block of code that two threads may not execute at the same time. Use of mutexes should be minimized, as they can slow down multi-threaded code so that it loses its advantages over single-threaded code.

## Properties

| Name | Type | Description |
| ---- | ---- | ----------- |
| [Lock](Mutex_Lock.md) | Method | Locks the mutex |
| [Unlock](Mutex_Unlock.md) | Method | Unlocks the mutex |
| [CreateMutex](CreateMutex.md) | Function | Creates a new mutex |

## Examples

```lua
-- Create a new mutex
local mutex = CreateMutex()

-- Thread 1
mutex:Lock()
-- Code that should not be executed by both threads at the same time
mutex:Unlock()

-- Thread 2
mutex:Lock()
-- Code that should not be executed by both threads at the same time
mutex:Unlock()
```

Note: The example assumes that multi-threading is already set up in Lua.