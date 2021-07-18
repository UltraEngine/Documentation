# Create a Project

To start programming with C++ on Windows you need to install the free [Visual Studio Community Edition](https://visualstudio.microsoft.com/vs/) from Microsoft.

To start programming with C++ on macOS you need to install the free [Xcode](https://apps.apple.com/us/app/xcode/id497799835) IDE from Apple.

To start programming with C++ on Linux you should install the free [Visual Studio Code](https://code.visualstudio.com/) IDE from Microsoft.

To create a new project click the **Create** link in the **Projects** panel. Enter the project name and location, then click the **Create** button to generate the new project:
<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_create_project.png' width='600px'/>

The project folder will be opened automatically.

## Compiling on Windows

Double-click the .sln file to open the Visual Studio solution:

<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_project_folder.png' width='500px'/>

Once Visual Studio is opened, you can compile and run the project by selecting the **Debug > Start Debugging** menu item:

<img src='https://github.com/Leadwerks/Documentation/raw/master/Images/UltraAppKit_Visual_Studio.png' width='1000px'/>

## Compiling on macOS

Double-click the .xcodeproj file to open the macOS project in Xcode 12.2 or later. Press command + R to build and run your project.

## Compiling on Linux

You must install required development libraries by running this line in the terminal:

```txt
sudo apt install build-essential libx11-dev libxmu-dev libxft-dev libxcursor-dev
```

To compile Ultra App Kit on Linux [Visual Studio Code](https://www.leadwerks.com/community/clients/purchases) is recommended. Select the **File > Open Folder** menu item and choose your project's folder. The two extensions below are required to compile C++ code:

- [C++ Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [Makefile Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools)

In the Makefile tools tab, set **Configuration** to **Debug**, **Build Target** to **x64**, and **Launch Target** to the debug build of your project, which is the project name followed by "_d".

## Code Samples

This documentation system describes all available classes and functions in the SDK. You can copy any code samples in the documentation into the *main.cpp* file to run that sample. Try running the code example [here](CreateButton.md) in your project.
