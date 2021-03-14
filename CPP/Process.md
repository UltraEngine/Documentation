# Process #
A process is an external executable your program can launch and interact with.

### Properties ###
| Name | Type | Description |
|---|---|---|
| errorstream | const shared_ptr<[Stream](Stream.md)\>& | stream for reading process error output |
| path | const WString& | path to process executable |
| readstream | const shared_ptr<[Stream](Stream.md)\>& | stream for reading process output |
| writestream | const shared_ptr<[Stream](Stream.md)\>& | stream for writing to the process input |
| [Close](Process_Close.md) | Method | Closes the handle to a running process |
| [Terminate](Process_Terminate.md) | Method | forcefully quits a running process |
| [Wait](Process_Wait.md) | Method | wait for the process to finish running |
| [CreateProcess](CreateProcess.md) | Function | creates a new process |
