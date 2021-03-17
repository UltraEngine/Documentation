<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/appkit_logo.png' width='400px'/>

Welcome to the **Ultra App Kit** documentation. You're about to learn how to easily create fast and responsive desktop GUI applications with pixel-perfect DPI scaling.

## Getting Started ##

When you first run Ultra App Kit you will be prompted to sign into your Ultra Engine account. This only needs to be done once for each new computer you install the program on. If you do not have an account you can create one [here](https://www.leadwerks.com/community/register/).

Once you have signed in, the program interface will appear like this:
<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_interface.png' width='600px'/>

The program is separated into three main panels that can be shown by selecting the tabs at the top of the window.

The **Projects** panel contains a list of recent projects and allows you to create new projects or add existing ones.

The **Learn** panel contains links to documentation and other online resources including video tutorials and the technical assistance forum.

The **Community** panel contains links to community features, including forums, blogs, and the Ultra Engine Marketplace.

## Creating a Project ##

To start programming with C++ you need to install the free [Visual Studio 2019 Community Edition](https://visualstudio.microsoft.com/vs/) from Microsoft.

To create a new project click the **Create** link in the **Projects** panel. Enter the project name and location, then click the **Create** button to generate the new project:
<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_create_project.png' width='600px'/>

The project folder will be opened automatically. Double-click the .sln file to open the Visual Studio solution:

<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_project_folder.png' width='500px'/>

Once Visual Studio is opened, you can compile and run the project by selecting the **Debug > Start Debugging** menu item:

<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_Visual_Studio.png' width='1000px'/>

This documentation system describes all available classes and functions in the SDK. You can copy any code samples in the documentation into the *main.cpp* file to run that sample. Try running the code example [here](CreateButton.md) in your project.

For further assistance, you can ask questions and get answers from staff and other developers in the [technical assistance forum](https://www.leadwerks.com/community/forum/91-technical-assistance).

## Importing Ultra App Kit in an Existing Project

```c++
//Include header file
#include "C:/Program Files (x86)/Steam/steamapps/common/Ultra App Kit/Include"

//Compile library into project
#pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Include")
```

THe following preprocessor definitions:
```
_SILENCE_CXX17_ITERATOR_BASE_CLASS_DEPRECATION_WARNING
_SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING
_WINSOCK_DEPRECATED_NO_WARNINGS
_HAS_STD_BYTE=0
_CRT_NONSTDC_NO_DEPRECATE
_CRT_SECURE_NO_WARNINGS
_ULTRA_APPKIT
```
Additionally, the _DEBUG preprocessor definition should be present in the debug build.
