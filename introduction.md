# Ultra Engine Documentation

Welcome to the Ultra Engine documentation. Here you will learn how to use the software to build high-performance games and applications with the world's fastest game engine.

Ultra Engine is currently available in early access mode, consisting of a C++ programming SDK for Windows that serves as a foundation for continued development.

## System Requirements

- Discrete GPU with support for Vulkan 1.3 (Integrated graphics are not supported yet)
- Windows 10 or 11
- [Microsoft Visual Studio](https://visualstudio.microsoft.com/#vs-section)

## Additional Software

- [Vulkan SDK](https://vulkan.lunarg.com/sdk/home)

You can run the [Ultra Engine benchmarks](https://github.com/UltraEngine/Benchmarks) to make sure your computer is compatible.

## Installation

First, download and install the [Ultra Engine Client](https://ultraengine.github.io/files/UltraClient.exe). This application will allow you to install different versions of the game engine and receive updates. When you open the application you will be prompted to sign into your Ultra Engine account. If you do not have an account yet, you can create one [here](https://www.ultraengine.com/community/register).

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_signin.jpg)

When you sign into your account in the application, it will look like this:

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_start.png)

The **Projects** tab displays a list of your projects for easy access, and allows new project creation.

The **Updates** tab allows you to select and install a version of the engine.

The **Community** tab contains links to community features you can access on our site.

The **Learn** tab contains links to documentation.

The **Billing** tab contains information about your account and plan.

The **Settings** tab contains various settings for the cient application.

When your subscription plan is active, you can select a channel in the **Updates** panel and install the engine. If your plan is not active, you can renew it [here](https://www.ultraengine.com/community/store/category/1-software/).

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_install.png)

The default channel will contain the current stable build, which does not change. You can select a newer version and receive more frequent updates, but the releases will not be as thoroughly tested. If you want to switch channels, uninstall the engine and select a new channel to install.

Once the game engine is installed you can create a new project in the **Projects** tab. Press the **Create** button, fill in the required information, and press okay to get started.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_newproject.png)

The folder containing your project will be opened. You can open the .sln file with Visual Studio and start coding. If you do not have Visual Studio installed, [download it now](https://visualstudio.microsoft.com/#vs-section). When running the installer, make sure the *Desktop development with C++* option is selected.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/vs_components.png)

You can run any of the [examples](LoadModel.md) in this documentation by copying and pasting the code into your main.cpp file. Compile and run the project and the example will be shown.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/projectfiles.png)

Your project will be listed in the projects panel for easy access.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_projects.png)

## Updating

The **Updates** tab will show an indicator when an update is available. After installing the update, you may see an icon indicating that some of your projects are out of date. This happens when the files in the project templates receive any changes.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_projectoutdated.png)

You can click the icon to see a list of all the files that have been modified. When you press the **OK** button to update the project, the new files will overwrite your existing project files. To prevent accidental data loss, a copy of your project file will be saved in the "backup" folder in your project directory.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_projectsync.png)

You can view changes in text-based files by pressing the **Diff** button. This will open both versions of the file side-by-side and allow you to pick and choose which changes you want to insert. This feature requires [Visual Studio Code](https://code.visualstudio.com/download) to be installed, or you can set your own diff tool and command line in the **Settings** tab.

## Distribution

Only the release build of your game should be distributed. The debug build of your game will end with the suffix "_d.exe" and should not be included.

You can pack all game data files (models, textures, etc.) into an [encrypted Zip package](https://www.ultraengine.com/learn/Package) to protect them. Just load the archive at the beginning of your program with this code:

```c++
auto pak = LoadPackage("gamedata.zip");// load the archive
pak->SetPassword("xxxxxxxxxxxxx");// set your own password here
```

Note that AES encryption is not supported. If your Zip compression program has an option for legacy encryption, you should use that.

Your game should not include the shader source code files (.vert, .frag., .geom, .comp, .tese, .tesc). Only the compiled .spv files should be included.

If your code does not load any plugins you do not need to include the DLLs in the "Plugins" directory.

You should not distribute any files from the client application folder like the library, headers, template files, etc.

The only dependency your end users need to install is the [Microsoft Visual Studio Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe). There's a good chance they already have it installed from another game or application, but you should package this in your installer or select it in the install settings for your game on Steam.

## Continuing Development

This is just the beginning. There's a lot more great technology on the way! Here are some of the main features in development:

- New visual editor with scriptable extensions
- VR support
- Linux and Mac versions
- C# programming support
- Lua programming support
- Advanced global illumination and reflections
- Box2D physics

Your feedback is always valued, so feel free to [make a suggestion](https://www.ultraengine.com/community/forum/3-suggestion-box/) for any features you'd like to see in upcoming releases.
