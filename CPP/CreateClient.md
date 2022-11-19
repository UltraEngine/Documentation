# CreateClient

This function creates a new client and initializes a connection with the specified host.

## Syntax

- shared_ptr<[Client](Client.md)\> **CreateClient**(const [String](String.md)& host, const int port = 8888)

| Parameter | Description |
|---|---|
| host | IP address to connect to |
| port | port number to use |

## Returns

If a connection can be initialized a new client is returned, otherwise NULL is returned.

## Remarks

Note that the client will not actuallly be connected to the host until a MESSAGE_CONNECT message is returned by [Client::Update](Client_Update.md).

## Example

This example shows one of the simplest possible networked programs. The order of events is as follows:
1. The server and client are created
2. The client attempts to connect to the server
3. The server receives the request from the client to connect
4. The client receives confirmation that it successfully connected to the server
5. The client sends a chat message
6. The server receives the chat message and disconnects from the client
7. The client receives notification it has been disconnected, and the program ends

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    const int port = 8888;
    const int messageID = 101;

    //Create the server
    auto server = CreateServer(port);
    if (server == NULL) RuntimeError("Failed to create server");

    //Create a client and connect
    auto client = CreateClient("127.0.0.1", port);
    if (client == NULL) RuntimeError("Failed to create client");
    
    while (true)
    {
        //Evaluate server messages
        auto msg = server->Update();
        switch (msg.id)
        {
        case MESSAGE_CONNECT:
            Print("Client connected");
            break;
        case messageID:
            Print(msg.data->PeekString(0));
            server->Disconnect(msg.source);
            break;
        }

        //Evaluate client messages
        msg = client->Update();
        switch (msg.id)
        {
        case MESSAGE_DISCONNECT:
            Print("Disconnected from server");
            return 0;
            break;
        case MESSAGE_CONNECT:
            client->Send(messageID, "Hello, Server!");
            break;
        }

        Sleep(5);
    }
    return 0;
}
```
