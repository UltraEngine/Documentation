# CreateServer

```lua
-- CreateServer function creates a server object and returns a shared_ptr to it.
-- @param port The port number to use.
-- @return A shared_ptr to the created server object.
function CreateServer(port)
```

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
-- Import the required libraries
local UltraEngine = require("UltraEngine")

-- Define the port and message ID
local port = 8888
local messageID = 101

-- Create the server
local server = CreateServer(port)
if server == nil then
    error("Failed to create the server")
end

-- Create a client and connect
local client = CreateClient("127.0.0.1", port)
if client == nil then
    error("Failed to create the client")
end

while true do
    -- Evaluate server messages
    local msg = server:Update()
    if msg.id == MESSAGE_CONNECT then
        print("Client connected")
    elseif msg.id == messageID then
        print(msg.data:PeekString(0))
        server:Disconnect(msg.source)
    end

    -- Evaluate client messages
    msg = client:Update()
    if msg.id == MESSAGE_DISCONNECT then
        print("Disconnected from server")
        return 0
    elseif msg.id == MESSAGE_CONNECT then
        client:Send(messageID, "Hello, Server!")
    end

    Sleep(10)
end
```