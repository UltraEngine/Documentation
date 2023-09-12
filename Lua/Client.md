# Client

Base class: [Object](Object.md)

This class handles network client functionality.

## Methods

### Client:Disconnect()

Disconnects from the server.

### Client:Send(message)

Sends a message to the server.

**Parameters:**

- `message` (string) - The message to be sent.

### Client:Update()

Updates the server and checks for messages.

## Functions

### CreateClient()

Creates a new client.

**Returns:**

- `client` (table) - The newly created client object.