# StreamBuffer

This class provides an interface to manipulate part of a file as if it was a memory block, without loading the entire file into memory at once. This can be useful when working with very large files. Random access speeds on mechanical hard drives are much slower than solid state drives, so if you are processing big data sets you will probably want to use an SSD.

Base class: [Buffer](Buffer.md)

| Property | Type | Description |
|-|-|-|
| [CreateStreamBuffer](CreateStreamBuffer.md) | Function | creates a new StreamBuffer object |
