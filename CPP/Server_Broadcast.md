# Server::Broadcast

This method sends a message from the server to all connected clients.

## Syntax

- void **Broadcast**(const int id, shared_ptr<[Buffer](Buffer.md)\> data, const int channel = 0, const MessageFlags flags = MESSAGE_DEFAULT)
- void **Broadcast**(const int id, const [String](String.md)& data, const int channel = 0, const MessageFlags flags = MESSAGE_DEFAULT)
- void **Broadcast**(const int id, const [WString](WString.md)& data, const int channel = 0, const MessageFlags flags = MESSAGE_DEFAULT)

| Parameter | Description |
|---|---|
| id | user-defined message ID |
| data | string or binary data to send, or NULL if the message only consists of the ID |
| channel | optional channel to send in, for ordered messages |
| flags | optional message flags, can be MESSAGE_DEFAULT or any combination of MESSAGE_SEQUENCED, MESSAGE_RELIABLE, and MESSAGE_BUFFERED.
