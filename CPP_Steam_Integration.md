# Steamworks SDK Integration #
The [Steamworks SDK](https://partner.steamgames.com/doc/sdk) provides a range of features which are designed to help ship your application or game on Steam in an efficient manner. This tutorial will explain how to add the Steamworks SDK into your C++ application and initialize the Steam overlay.

## Compiling ##
First, [download the Steamworks SDK](https://partner.steamgames.com/downloads/steamworks_sdk.zip) from Valve.

Extract the contents of the zip file to "(Project Folder)\Source\Steamworks".

Add this line of code anywhere in your "Project.h" file:
```c++
#include "Steamworks/sdk/public/steam/steam_api.h"
```
In Visual Studio, drag the file "Source\\Steamworks\\sdk\\redistributable_bin\\win64\\steam_api64.lib" into the solution explorer. 

![](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/steamworks_lib.png)

Copy the file "Source\\Steamworks\\sdk\\redistributable_bin\\win64\\steam_api64.dll" into your project folder.

At this point, your project should be able to compile successfully.

## Usage ##
In "main.cpp", at the start of your program add this line of code:
```c++
SteamAPI_Init()
```
At the end of the main function, add this line of code:
```c++
SteamAPI_Shutdown()
```
Your main.cpp file should now look something like this:
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
    SteamAPI_Init();

    ...


    SteamAPI_Shutdown();
    return 0;
}
```
To test your game, you need to create a text file in your project folder named "steam_appid.txt" with these contents. This tells the SDK that your application is using an application ID for testing:
```
480
```
When you run your application, the Steam overlay can be shown by pressing Shift+Tab. This is all you need to publish a game or application on Steam. See the [Steamworks documentation](https://partner.steamgames.com/doc/sdk) for additional features you can use.

## Delayed DLL Loading ##
You can set your application to defer loading of the Steamworks DLL until it is needed. If your application does not initialize the Steamworks SDK, the DLL will never get loaded. This allows you to ship a non-Steam version of your game without having to include the Steamworks DLL.

To enable delayed DLL loading, open the project settings in Visual Studio. In the **Linker \> Command Line** options add this text:
```txt
/delayload:steam_api64.dll 
```
Make sure this is added for all configurations, and the non-Steam version of your game will be able to run without the DLL. To prevent the application from silently failing, you may wish to add a check for the DLL when Steam is initialized:
```c++
bool InitSteam()
{
    if (FileType("steam_api64.dll ") != 1)
    {
        Print("steam_api64.dll is missing.");
        return false;
    }
    return SteamAPI_Init();
}
```
