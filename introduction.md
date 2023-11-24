# Ultra Engine Documentation

Welcome to the Ultra Engine documentation. Here you will learn how to use the software to build high-performance games and applications with the world's fastest game engine.

Ultra Engine is currently available in early access mode, with support for the C++ and Lua programming languages.

## System Requirements

- Discrete GPU with support for Vulkan 1.3 (integrated graphics are not supported yet). Please note that in the current build AMD graphics cards are experiencing visual artifacts.
- Windows 10 or 11
- [Microsoft Visual C++ Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe)

#### Additional Recommended Software

- [Vulkan SDK](https://vulkan.lunarg.com/sdk/home)
- [Microsoft Visual Studio](https://visualstudio.microsoft.com/#vs-section) (used for C++ programming)
- [Microsoft Visual Studio Code](https://code.visualstudio.com) (used for Lua programming)

## Installation

First, download and install the [Ultra Engine Client](https://github.com/UltraEngine/ultraengine.github.io/raw/main/UltraClient.exe). This application will allow you to install different versions of the game engine and receive updates. When you open the application you will be prompted to sign into your Ultra Engine account. If you do not have an account yet, you can create one [here](https://www.ultraengine.com/community/register).

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_signin.jpg)

When you sign into your account in the application, it will look like this:

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_start.png)

The **Updates** tab allows you to select and install a version of the engine.

The **Community** tab contains links to community features you can access on our site.

The **Learn** tab contains links to documentation.

The **Billing** tab contains information about your account and license.

The **Settings** tab contains various settings for the client application.

When your license is active, you can select a channel in the **Updates** panel and install the engine. If you do not have a license you can get one [here](https://www.ultraengine.com/community/store/category/1-software/).

The default channel will contain the current stable build, which does not change. You can select a newer version and receive more frequent updates, but the releases will not be as thoroughly tested. If you want to switch channels, uninstall the engine and select a new channel to install.

Once the game engine is installed you can press the launch button to run the [editor](editor.md) and begin building games.

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
