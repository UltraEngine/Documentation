# server:Broadcast()

This function sends a message from the server to all connected clients.

## Syntax

- **server:Broadcast**(id: number, data: Buffer, channel: number, flags: number)
- **server:Broadcast**(id: number, data: string, channel: number, flags: number)
- **server:Broadcast**(id: number, data: wstring, channel: number, flags: number)

## Parameters

- id (number): User-defined message ID.
- data (Buffer, string, wstring): String or binary data to send. Use `nil` if the message only consists of the ID.
- channel (number, optional): Optional channel to send in for ordered messages.
- flags (number, optional): Optional message flags. Can be `MESSAGE_DEFAULT`, or any combination of `MESSAGE_SEQUENCED`, `MESSAGE_RELIABLE`, and `MESSAGE_BUFFERED`.

## Example

```lua
server:Broadcast(1, "Hello, world!", 0, MESSAGE_DEFAULT)
```