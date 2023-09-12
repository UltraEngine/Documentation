# Client:Update

This function checks for incoming messages and sends any queued messages.

## Syntax

```lua
--[[
Message Update(int timeout)
]]
```

### Parameters

- `timeout` (optional): timeout time in seconds

### Returns

Returns a new `Message` object. The returned message ID may be `MESSAGE_NONE`, `MESSAGE_CONNECT`, `MESSAGE_DISCONNECT`, or a user-defined value.

If the message ID is not `MESSAGE_NONE`, then the message should be evaluated and the function should be called again to check for more messages.