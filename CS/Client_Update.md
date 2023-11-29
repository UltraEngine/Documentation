# Client.Update

This method checks for incoming messages and sends any queued messages.

## Syntax

```csharp
Message Update(int timeout = 0);
```

| Parameter | Description |
|---|---|
| timeout | optional timeout time in seconds |

## Returns

Returns a new `Message` object. The returned message ID may be `MESSAGE_NONE`, `MESSAGE_CONNECT`, `MESSAGE_DISCONNECT`, or a user-defined value.

If the message ID is not `MESSAGE_NONE` then the message should be evaluated and the method should be called again to check for more messages.

## Example

```csharp
Message message = client.Update();

if (message.MessageID != MessageID.MESSAGE_NONE)
{
    // Evaluate the message
    // ...

    // Call the method again to check for more messages
    message = client.Update();
}
```