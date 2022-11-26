# Ultra Engine Documentation

Welcome to the Ultra Engine documentation. Here you will learn how to use the software to build high-performance games and applications.

## System Requirements

- Discrete GPU with support for Vulkan 1.3 (Integrated graphics are not supported yet)
- Windows 10 or 11
- [Microsoft Visual Studio 2022](https://visualstudio.microsoft.com/) (Community, Professional, or Enterprise)

You can try running the [Ultra Engine benchmarks](https://github.com/UltraEngine/Benchmarks) to make sure your computer is compatible.

## Installation

First, download and run the [Ultra Engine Client](https://www.ultraengine.com/files/UltraEngineClient.exe). This application will allow you to install different versions of the software and receive updates. When you open the application you will be prompted to sign into your Ultra Engine account. If you do not have an account yet, you can create one [here](https://www.ultraengine.com/community/register).

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_signin.png)

When you sign into your account in the application, it will look like this:

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_start.png)

The **Projects** tab displays a list of your projects for easy access, and allows new project creation.

The **Updates** tab allows you to select and install a version of the engine.

The **Community** tab contains links to community features you can access on our site.

The **Learn** tab contains links to documentation.

The **Billing** tab contains information about your account and plan.

The **Settings** tab contains various settings for the cient application.

When your subscription plan is active, you will be able to select a channel in the **Updates** panel and install the engine. If you need to activate your plan, you can do so [here](https://www.ultraengine.com/community/store).

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_install.png)

The default channel will contain the current stable build, which does not change. You can select a development channel and receive more frequent updates, but the releases will not be as thoroughly tested. If you want to switch channels, uninstall the engine and select a new channel to install.

Once the engine is installed you can create a new project in the **Projects** tab. Press the **Create** button, fill in the required information, and press okay to get started.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_newproject.png)

The folder containing your project will be opened. You can open the .sln file with Visual Studio and start coding:

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/projectfiles.png)

Your project will be listed in the projects panel for easy access:

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_projects.png)

## Updating

The **Updates** tab will show an indicator when an update is available. After installing the update, you may see an icon indicating that some of your projects are out of date. This happens when the files in the project templates receive any changes.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_projectoutdated.png)

You can click the icon to see a list of all the files that have been modified. When you press the **OK** button to update the project, the new files will overwrite your existing project files. To prevent accidental data loss, a copy of your project file will be saved in the "backup" folder in your project directory.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/client_projectsync.png)

You can view changes in text-based files by pressing the **Diff** button. This will open both versions of the file side-by-side and allow you to pick and choose which changes you want to insert. This feature requires [Visual Studio Code](https://code.visualstudio.com/download) to be installed, or you can set your own diff tool and command line in the **Settings** tab.

## Distribution

Only the release build of your game should be distributed. The debug build of your game will end with the suffix "_d.exe" and should not be distributed.

The debug build stores the physics library as separate DLLs for external debugging. The release build does not need these DLLs:
- newton_d.dll
- dCustomJoints_d.dll
- dContainers_d.dll

Your game should not include the shader source code files (.vert, .frag., .geom, .comp, .tese, .tesc). Only the compiled .spv files should be included.

If your code does not load any plugins you do not need to include the DLLs in the "Plugins" directory.

You should not distribute any files from the client application folder like the library, headers, template files, etc.

The only dependency your end users need to install is the [Microsoft Visual Studio Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe). There's a good chance they already have it installed from another game or application, but you should package this in your installer or select it in the install settings for your game on Steam.
