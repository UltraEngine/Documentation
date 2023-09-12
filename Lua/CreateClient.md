# CreateClient

This function creates a new client and initializes a connection with the specified host.

## Syntax

**CreateClient**(host: string, port: number): Client

- `host`: IP address to connect to
- `port`: (optional) port number to use, default is 8888

## Returns

If a connection can be initialized, a new client is returned. Otherwise, `nil` is returned.

## Remarks

Note that the client will not actually be connected to the host until a `MESSAGE_CONNECT` message is returned by `Client:Update`.

## Example

This example shows one of the simplest possible networked programs. The order of events is as follows:
1. The server and client are created
2. The client attempts to connect to the server
3. The server receives the request from the client to connect
4. The client receives confirmation that it successfully connected to the server
5. The client sends a chat message
6. The server receives the chat message and disconnects from the client
7. The client receives notification it has been disconnected, and the program ends

```lua
port = 8888
messageID = 101

--Create the server
server = CreateServer(port)
if server == nil then RuntimeError("Failed to create server") end

--Create a client and connect
client = CreateClient("127.0.0.1", port)
if client == nil then RuntimeError("Failed to create client") end

while true do
    --Evaluate server messages
    msg = server:Update()
    if msg.id == MESSAGE_CONNECT then
        Print("Client connected")
    elseif msg.id == messageID then
        Print(msg.data:PeekString(0))
        server:Disconnect(msg.source)
    end

    --Evaluate client messages
    msg = client:Update()
    if msg.id == MESSAGE_DISCONNECT then
        Print("Disconnected from server")
        return 0
    elseif msg.id == MESSAGE_CONNECT then
        client:Send(messageID, "Hello, Server!")
    end

    Sleep(5)
end
return 0
```