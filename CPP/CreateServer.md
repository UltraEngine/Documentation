# CreateServer

- shared_ptr<[Server](Server.md)\> **CreateServer**(const int port = 8888)

| Parameter | Description |
|---|---|
| port | port number to use |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    const int port = 8888;
    const int messageID = 101;

    //Create the server
    auto server = CreateServer(port);

    //Create a client and connect
    auto client = CreateClient();
    client->Connect("127.0.0.1", port);
    
    while (true)
    {
        //Evaluate server messages
        auto msg = server->Update();
        if (msg)
        {
            switch (msg->id)
            {
            case MESSAGE_CONNECT:
                Print("Client connected");
                break;
            case messageID:
                Print(msg->data->PeekString(0));
                auto peer = msg->peer.lock();
                if (peer)
                {
                    server->Disconnect(peer);
                }
                break;
            }
        }

        //Evaluate client messages
        msg = client->Update();
        if (msg)
        {
            switch (msg->id)
            {
            case MESSAGE_DISCONNECT:
                Print("Disconnected from server");
                exit(0);
                break;
            case MESSAGE_CONNECT:
                client->Send(messageID, "Hello, Server!");
                break;
            }
        }

        Sleep(5);
    }
    return 0;
}
```
