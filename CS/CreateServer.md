# CreateServer

- `Server CreateServer(int port = 8888)`

| Parameter | Description |
|---|---|
| port | port number to use |

## Example

This example shows one of the simplest possible networked programs. The order of events is as follows:
1. The server and client are created
2. The client attempts to connect to the server
3. The server receives the request from the client to connect
4. The client receives confirmation that it successfully connected to the server
5. The client sends a chat message
6. The server receives the chat message and disconnects from the client
7. The client receives notification it has been disconnected, and the program ends

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        int port = 8888;
        int messageID = 101;

        //Create the server
        Server server = CreateServer(port);
        if (server == null) RuntimeError("Failed to create server");

        //Create a client and connect
        Client client = CreateClient("127.0.0.1", port);
        if (client == null) RuntimeError("Failed to create client");

        while (true)
        {
            //Evaluate server messages
            Message msg = server.Update();
            switch (msg.id)
            {
                case MESSAGE_CONNECT:
                    Print("Client connected");
                    break;
                case messageID:
                    Print(msg.data.PeekString(0));
                    server.Disconnect(msg.source);
                    break;
            }

            //Evaluate client messages
            msg = client.Update();
            switch (msg.id)
            {
                case MESSAGE_DISCONNECT:
                    Print("Disconnected from server");
                    return 0;
                    break;
                case MESSAGE_CONNECT:
                    client.Send(messageID, "Hello, Server!");
                    break;
            }

            Sleep(10);
        }
        return 0;
    }
}
```
Note: You need to replace the `Print` and `Sleep` functions with the appropriate C# equivalents.