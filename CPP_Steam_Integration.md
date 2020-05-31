# Steamworks SDK Integration #
The Steamworks SDK provides a range of features which are designed to help ship your application or game on Steam in an efficient manner. This tutorial will explain how to add the Steamworks SDK into your C++ application.

First, [download the Steamworks SDK](https://partner.steamgames.com/doc/sdk) from Valve.

Extract the contents of the zip file to "(Project Folder)\Source\Libraries\Steamworks".

Add this line of code anywhere in your "Project.h" file:
```c++
#include "Source/Libraries/Steamworks/public/Steam/steam_api.h"
```
In Visual Studio, drag the file "Source/Libaries/Steamworks/redistributable_bin/win64/steam_api64.lib" into the solution explorer.

In "main.cpp", at the start of your program add this line of code:
```c++
SteamAPI_Init()
```
At the end of the main function, add this line of code:
```c++
SteamAPI_Shutdown()
```
Your main.cpp file should now look something like this:
