# Semaphore

Base class: [Object](Object.md)

This class allows multithreaded applications to perform blocking operations. A semaphore can be signaled by one thread and waited on by another thread, for thread synchronization.

A semaphore will provide faster threading performance than frequent mutex locks.

| Property | Type | Description |
|---|---|---|
| [Signal](Semaphore_Signal.md) | Method | sets the semaphore to the signaled state and releases any blocked threads waiting for it |
| [Wait](Semaphore_Wait.md) | Method | waits for the semaphore to reach the signaled state, and then resets it to the unsignaled state |
| [CreateSemaphore](CreateSemaphore.md) | Function | creates a new semaphore object |

## Syntax

```csharp
public class Semaphore : Object
{
    public void Signal();
    public void Wait();
    public static Semaphore CreateSemaphore();
}
```

## Example
```csharp
Semaphore semaphore = Semaphore.CreateSemaphore();

Thread thread1 = new Thread(() =>
{
    semaphore.Wait();
    // Perform some task
    semaphore.Signal();
});

Thread thread2 = new Thread(() =>
{
    semaphore.Wait();
    // Perform some task
    semaphore.Signal();
});

thread1.Start();
thread2.Start();

// Wait for the threads to complete
thread1.Join();
thread2.Join();
```