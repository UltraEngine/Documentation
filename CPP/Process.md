# Process

Base class: [Object](Object.md)

A process is an external executable your program can launch and interact with.

| Property | Type | Description |
|---|---|---|
| errorstream | const shared_ptr<[Stream](Stream.md)\>& | read-only pointer to stream for reading process error output |
| path | const WString& | read-only path to process executable |
| readstream | const shared_ptr<[Stream](Stream.md)\>& | read-only pointer to stream for reading process output |
| writestream | const shared_ptr<[Stream](Stream.md)\>& | read-only pointer to stream for writing to the process input |
| [Close](Process_Close.md) | Method | terminates a running process |
| [GetStatus](Process_GetStatus.md) | Method | returns the status of a running process |
| [Wait](Process_Wait.md) | Method | waits for the process to finish running and closes it |
| [CreateProcess](CreateProcess.md) | Function | creates a new process |
