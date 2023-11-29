## Syntax

- void **Broadcast**(int id, [Buffer](link-to-buffer-docs) data, int channel = 0, MessageFlags flags = MESSAGE_DEFAULT)
- void **Broadcast**(int id, string data, int channel = 0, MessageFlags flags = MESSAGE_DEFAULT)
- void **Broadcast**(int id, string data, int channel = 0, MessageFlags flags = MESSAGE_DEFAULT)

| Parameter | Description |
|---|---|
| id | user-defined message ID |
| data | string or binary data to send, or NULL if the message only consists of the ID |
| channel | optional channel to send in, for ordered messages |
| flags | optional message flags, can be MESSAGE_DEFAULT or any combination of MESSAGE_SEQUENCED, MESSAGE_RELIABLE, and MESSAGE_BUFFERED.