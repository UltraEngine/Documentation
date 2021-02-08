# Thread::GetResult #
This method can retrieve a return value set by a thread when it finishes execution.

## Syntax ##
- shared_ptr<[Object](Object.md)\> GetResult()

## Returns ##
If the thread is finished the thread result is returned, otherwise NULL is returned.
