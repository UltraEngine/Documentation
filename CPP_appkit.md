
   ![dsf](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/appkitlogo.png)

Welcome to the official Ultra App Kit documentation. You are about to start learning how to make desktop GUI applications that look great and feel fast and responsive.

## Getting Started ##

When you first run Ultra App Kit the project manager will appear. This allows you to create new projects, view existing projects, and also contains links to documentation, community features, and other resources.

If you are running the program for the first time the new project dialog will be shown automatically. You can get back to this screen later by clicking the "New" link under the Projects tab. Enter the name and location of the project and press Next to create your first project. The project folder will be opened in the system file browser.

The *Source* folder contains source code files used in your project. The *Plugins* folder contains optional plugins your application can load and use. The *Themes* folder contains color themes your application can load to change its appearance.

Open the Visual Studio solution (.sln) file to begin programming with Ultra App Kit. You can download Microsoft Visual Studio for free [here](https://visualstudio.microsoft.com/downloads/).

## Programming with Ultra App Kit ##

The documentation here contains [hundreds of examples](CreateButton.md) for every available command in the SDK. Just copy any example's code and paste it into the *main.cpp* source code file to run the example. Here is one simple program you can try:

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    Print("Hello, world!");
}
```

If you are just getting started we suggest the beginner tutorials [here](.).
