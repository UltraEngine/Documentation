# Client.Send

This method sends a message from the client to the server.

## Syntax

- bool **Send**(int id, [Buffer](Buffer.md) data, int channel = 0, MessageFlags flags = MessageFlags.MESSAGE_DEFAULT)
- bool **Send**(int id, string data, int channel = 0, MessageFlags flags = MessageFlags.MESSAGE_DEFAULT)
- bool **Send**(int id, string data, int channel = 0, MessageFlags flags = MessageFlags.MESSAGE_DEFAULT)

| Parameter | Description |
|---|---|
| id | user-defined message ID |
| data | string or binary data to send, or NULL if the message only consists of the ID |
| channel | optional channel to send in, for ordered messages |
| flags | optional message flags, can be MessageFlags.MESSAGE_DEFAULT or any combination of MessageFlags.MESSAGE_SEQUENCED, MessageFlags.MESSAGE_RELIABLE, and MessageFlags.MESSAGE_BUFFERED.

## Returns

Returns true of the message is successfully send, otherwise false is returned.

## Example

```csharp
int id = 10;
string data = "Hello, server!";
int channel = 0;
MessageFlags flags = MessageFlags.MESSAGE_DEFAULT;

bool success = client.Send(id, data, channel, flags);
if(success)
{
    Console.WriteLine("Message sent successfully");
}
else
{
    Console.WriteLine("Failed to send message");
}
```
(Note: Make sure to replace `client` with your actual client object)