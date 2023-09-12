## Peer

Base class: [Object](Object.md)

This class is an object representing another computer this machine is connected to.

### Properties

- `host`: read-only IP address (const **string**)
- `port`: read-only port number (const **number**)

## Example

```lua
-- Create a new Peer object
local peer = Peer()

-- Access the host IP address
local host = peer.host

-- Access the port number
local port = peer.port
```