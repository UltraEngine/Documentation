**Welcome to the Ultra App Kit documentation. You're about to learn how to easily create fast and responsive desktop GUI applications with pixel-perfect DPI scaling.**

<embed src="https://www.ultraengine.com/community/uploads/monthly_2021_03/1280330185_IntroductiontoUltraAppKit.mp4.51d10cd21137bf4a148738797220782f.mp4" />

## Getting Started ##

When you first run Ultra App Kit you will be prompted to sign into your Ultra Engine account. This only needs to be done once for each new computer you install the program on. If you do not have an account you can create one [here](https://www.ultraengine.com/community/register/).

Once you have signed in, the program interface will appear like this:
<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_interface.png' width='600px'/>

The program is separated into three main panels that can be shown by selecting the tabs at the top of the window.

The **Projects** panel contains a list of recent projects and allows you to create new projects or add existing ones.

The **Learn** panel contains links to documentation and other online resources including video tutorials and the technical assistance forum.

The **Community** panel contains links to community features, including forums, blogs, and the Ultra Engine Marketplace.

## Create a Project ##

To start programming with C++ you need to install the free [Visual Studio 2019 Community Edition](https://visualstudio.microsoft.com/vs/) from Microsoft.

To create a new project click the **Create** link in the **Projects** panel. Enter the project name and location, then click the **Create** button to generate the new project:
<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_create_project.png' width='600px'/>

The project folder will be opened automatically. Double-click the .sln file to open the Visual Studio solution:

<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_project_folder.png' width='500px'/>

Once Visual Studio is opened, you can compile and run the project by selecting the **Debug > Start Debugging** menu item:

<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_Visual_Studio.png' width='1000px'/>

This documentation system describes all available classes and functions in the SDK. You can copy any code samples in the documentation into the *main.cpp* file to run that sample. Try running the code example [here](CreateButton.md) in your project.

For further assistance, you can ask questions and get answers from staff and other developers in the [technical assistance forum](https://www.leadwerks.com/community/forum/91-technical-assistance).

## Add to an Existing Project

If you have an existing project and you want to add the Ultra App Kit library to provide a front-end interface, you can accomplish this with the steps below.

### Header Search Paths

You must add a header search path in your project settings, for both release and debug configurations:
```txt
C:/Program Files/Ultra App Kit/Include
```

If you are using Ultra App Kit on Steam the default location will be here:
```txt
C:/Program Files (x86)/Steam/steamapps/common/Ultra App Kit/Include
```

### Include Header and Library

Add this code in your main project header to include the Ultra App Kit library. You may need to edit the location of the header and library files to match your machine's configuration:

```c++
//Include header file
#define _ULTRA_APPKIT
#include "C:\\Program Files\\Ultra App Kit\\Include\\UltraEngine.h"

//Compile library into project
#ifdef _WIN32
  #ifdef _WIN64
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win64\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win64\\App Kit.lib")
    #endif
  #else
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win32\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win32\\App Kit.lib")
    #endif  
  #endif  
#endif
```

If you are using Ultra App Kit on Steam here is the code for the default install location:

```c++
//Include header file
#define _ULTRA_APPKIT
#include "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Include\\UltraEngine.h"

//Compile library into project
#ifdef _WIN32
  #ifdef _WIN64
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win64\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win64\\App Kit.lib")
    #endif
  #else
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win32\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win32\\App Kit.lib")
    #endif
  #endif  
#endif
```
