# Server:Send

This method sends a message from the server to one connected client.

## Syntax

```lua
function Server:Send(client, id, data, channel, flags)
```

## Parameters

| Parameter | Description                                                                                                                                                                                                                                                               |
|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| client    | The connected client to send the message to.                                                                                                                                                                                                                               |
| id        | The user-defined message ID.                                                                                                                                                                                                                                              |
| data      | The string or binary data to send, or nil if the message only consists of the ID.                                                                                                                                                                                         |
| channel   | Optional channel to send in, for ordered messages.                                                                                                                                                                                                                        |
| flags     | Optional message flags, can be MESSAGE_DEFAULT or any combination of MESSAGE_SEQUENCED, MESSAGE_RELIABLE, and MESSAGE_BUFFERED.                                                                                                                                         |

## Usage

```lua
-- Sending a message with binary data
local client = -- The connected client (of type Peer)
local id = -- The user-defined message ID (an int)
local data = -- The binary data to send (of type Buffer)
local channel = -- The optional channel (an int)
local flags = -- The optional message flags (an int)

Server:Send(client, id, data, channel, flags)

-- Sending a message with a string
local client = -- The connected client (of type Peer)
local id = -- The user-defined message ID (an int)
local data = -- The string data to send (a string)
local channel = -- The optional channel (an int)
local flags = -- The optional message flags (an int)

Server:Send(client, id, data, channel, flags)

-- Sending a message with a wide string
local client = -- The connected client (of type Peer)
local id = -- The user-defined message ID (an int)
local data = -- The wide string data to send (a WString)
local channel = -- The optional channel (an int)
local flags = -- The optional message flags (an int)

Server:Send(client, id, data, channel, flags)
```