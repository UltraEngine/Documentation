# Client:Send

This function sends a message from the client to the server.

## Syntax

```lua
function Client:Send(id, data, channel, flags)
```

- **id** (number): user-defined message ID
- **data** (various types): string or binary data to send, or nil if the message only consists of the ID
- **channel** (number, optional): optional channel to send in, for ordered messages
- **flags** (number, optional): optional message flags, can be MESSAGE_DEFAULT or any combination of MESSAGE_SEQUENCED, MESSAGE_RELIABLE, and MESSAGE_BUFFERED.

## Returns

(boolean) Returns true if the message is successfully sent, otherwise false is returned.