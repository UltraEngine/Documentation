## Message

This class stores a networking message.

### Properties

- `data`: `Buffer` shared_ptr - message data
- `id`: `int` - message ID
- `source`: `Peer` shared_ptr - message sender

### Example

```lua
-- Create a new message
local message = {
    data = shared_ptr_Buffer,
    id = 12345,
    source = shared_ptr_Peer
}
```