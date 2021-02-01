# Process #
A process is an external executable your program can launch and interact with.

### Properties ###
| Name | Type | Description |
|---|---|---|
| errorstream | const shared_ptr<PipeStream>& | stream for reading process error output |
| path | const WString& | path to process executable |
| readstream | const shared_ptr<PipeStream>& | stream for reading process output |
| writestream | const shared_ptr<PipeStream>& | stream for writing to the process input |
| Close | Method | End execution |
| Wait | Method | Wait for the process to finish running |
| CreateProcess | Function | Creates a new process |
