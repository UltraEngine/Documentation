# GetUserAvatar

Namespace: [Steamworks](Steamworks.md)

This function retrieves the user's profile picture.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> **GetUserAvatar**(const uint64 userid)

| Parameter | Description |
|---|---|
| userid | user ID to retrieve the profile picture of |

## Returns

Returns a pixmap with the user's profile picture.

## Example

```lua
-- Initialize Steamworks
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return 1
end

-- Get user ID
local userid = Steamworks.GetUserId()

-- Get user avatar
local pixmap = Steamworks.GetUserAvatar(userid)
pixmap:Save("avatar.dds")
RunFile("avatar.dds")

-- Close Steam
Steamworks.Shutdown()
```
