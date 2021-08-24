# Condition

This class allows multithreaded applications to perform blocking operations. A condition can be signaled by one thread and waited on by another thread, for thread synchronization.

## Properties

| Name | Type | Description |
|---|---|---|
| [Signal](Condition_Signal.md) | Method | sets the condition to the signaled state and releases any blocked threads waiting for it |
| [Wait](Condition_Wait.md) | Method | waits for the condition to reach the signaled state, and then resets it to the unsignaled state |
| [CreateCondition](CreateCondition.md) | Function | creates a new condition object |
