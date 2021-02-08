# CreateThread #

## Syntax ##
- shared_ptr<[Thread](Thread.md)> **CreateThread**(shared_ptr<[Object](Object.md)\> entrypoint(shared_ptr<[Object](Object.md)\> extra), shared_ptr<[Object](Object.md)\> extra = NULL, const bool start = false);
- shared_ptr<[Thread](Thread.md)> **CreateThread**(std::function<void()> entrypoint, const bool start = false);

### Parameters ###

| Name | Description |
| --- | --- |
| entrypoint | function the thread will execute when it begins |
| extra | extra value passed to the entrypoint function |
| start | if set to true the thread will begin execution immediately, otherwise it will begin in the ready state |

## Returns ##
Returns a new thread.
