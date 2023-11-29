# Server.Send

This method sends a message from the server to one connected client.

## Syntax

- void **Send**(shared_ptr<[Peer](Peer.md)\> client, int id, shared_ptr<[Buffer](Buffer.md)\> data, int channel = 0, MessageFlags flags = MESSAGE_DEFAULT)
- void **Send**(shared_ptr<[Peer](Peer.md)\> client, int id, string data, int channel = 0, MessageFlags flags = MESSAGE_DEFAULT)
- void **Send**(shared_ptr<[Peer](Peer.md)\> client, int id, string data, int channel = 0, MessageFlags flags = MESSAGE_DEFAULT)

| Parameter | Description |
|---|---|
| client | connected client to send the message to |
| id | user-defined message ID |
| data | string or binary data to send, or NULL if the message only consists of the ID |
| channel | optional channel to send in, for ordered messages |
| flags | optional message flags, can be MESSAGE_DEFAULT or any combination of MESSAGE_SEQUENCED, MESSAGE_RELIABLE, and MESSAGE_BUFFERED.