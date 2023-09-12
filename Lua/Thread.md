# Thread

Base class: [Object](Object.md)

This class provides an interface for creating multithreaded applications. The Lua engine already uses extensive multithreading, and you generally do not need to use these commands yourself, but they are available for advanced programmers.

## Properties

| Property      | Type   | Description                           |
| ------------- | ------ | ------------------------------------- |
| [GetResult](Thread_GetResult.md)   | Method | returns the thread result              |
| [GetState](Thread_GetState.md)    | Method | returns the current thread state       |
| [Start](Thread_Start.md)   | Method | begins thread execution                |
| [Wait](Thread_Wait.md)    | Method | waits for the thread to complete execution |

## Functions

| Function      | Description                                            |
| ------------- | ------------------------------------------------------ |
| [CreateThread](CreateThread.md) | creates a new thread                        |
| [MaxThreads](MaxThreads.md)    | returns the number of simultaneous threads the CPU can execute |

Note: *shared_ptr* type is not supported in Lua.