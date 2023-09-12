# Semaphore

Base class: [Object](Object.md)

This class allows multithreaded applications to perform blocking operations. A semaphore can be signaled by one thread and waited on by another thread, for thread synchronization.

A semaphore will provide faster threading performance than frequent mutex locks.

| Property | Type | Description |
|---|---|---|
| [Signal](#semaphore_signal) | Method | sets the semaphore to the signaled state and releases any blocked threads waiting for it |
| [Wait](#semaphore_wait) | Method | waits for the semaphore to reach the signaled state, and then resets it to the unsignaled state |
| [CreateSemaphore](#createsemaphore) | Function | creates a new semaphore object |

## Method: Signal <a id="semaphore_signal"></a>

Sets the semaphore to the signaled state and releases any blocked threads waiting for it.

## Method: Wait <a id="semaphore_wait"></a>

Waits for the semaphore to reach the signaled state, and then resets it to the unsignaled state.

## Function: CreateSemaphore <a id="createsemaphore"></a>

Creates a new semaphore object.