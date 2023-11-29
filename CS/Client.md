# Client

Base class: [Object](Object.md)

This class handles network client functionality.

| Property | Type | Description |
|---|---|---|
| [Disconnect](Client_Disconnect.md) | Method | disconnects from the server |
| [Send](Client_Send.md) | Method | sends a message to the server |
| [Update](Client_Update.md) | Method | updates the server and checks for messages |
| [CreateClient](CreateClient.md) | Method | creates a new client |

### Example

```csharp
using UnityEngine;
using System.Collections;

public class Client : Object
{
    public void Disconnect()
    {
        // Disconnect implementation
    }

    public void Send(string message)
    {
        // Send implementation
    }

    public void Update()
    {
        // Update implementation
    }

    public static Client CreateClient()
    {
        // CreateClient implementation
        return new Client();
    }
}
```

Note: The example assumes that you are using Unity as the game engine.