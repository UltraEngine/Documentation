# Mutex

**Base class**: [Object](Object.md)

A mutex ("mutually exclusive") is used to defined a block of code that two threads may not execute at the same time. Use of mutexes should be minimized, as they can slow down multithreaded code so that it loses its advantages over single-threaded code.

| Property | Type | Description |
| - | - | - |
| [Lock](Mutex_Lock.md) | Method | locks the mutex |
| [Unlock](Mutex_Unlock.md) | Method | unlocks the mutex |
| [CreateMutex](CreateMutex.md) | Function | creates a new mutex |
