# Steamworks

Ultra Engine includes an optional module for adding functionality from the Steam API. These features can be added to your project by including the file "Steamworks/Steamworks.h" and enabling the "Steamworks/Steamworks.cpp" file.

This module is intended to provide easy access to the most commonly used Steam features. Including this module also provides direct access to the [Steamworks API](https://partner.steamgames.com/doc/api).

| Property | Type | Description |
|---|---|---|
| Initialize | Function | Initializes the Steam API |
| GetUserId | Function | gets the user's Steam profile ID |
| GetUserName | Function | gets the user's Steam profile name |
| GetUserAvatar | Function | gets the user's Steam profile picture |
| Shutdown | Function | Closes the Steam API |

The basic structure of a Steam-enabled game looks like this:
```c++
int main()
{
  //Initialize Steam API
  if (not Steamworks::Initialize()) return 1;

  while ()
  {
    
  }

  //Close Steam API
  Steamworks::Shutdown();  
}
```
