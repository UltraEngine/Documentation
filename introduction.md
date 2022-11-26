# Ultra Engine Documentation

Welcome to the Ultra Engine documentation. Here you will learn how to use the software to build high-performance games and applications.

## System Requirements

- Discrete GPU with support for Vulkan 1.3 (Integrated graphics are not supported yet)
- Windows 10 or 11
- [Microsoft Visual Studio 2022](https://visualstudio.microsoft.com/) (Community, Professional, or Enterprise)

You can try running the [Ultra Engine benchmarks](https://github.com/UltraEngine/Benchmarks) to make sure your computer is compatible.

## Installation

First, download and run the [Ultra Engine Client](https://www.ultraengine.com/files/UltraEngineClient.exe). This application will allow you to install different versions of the software and receive updates. When you open the application you will be prompted to sign into your Ultra Engine account. If you do not have an account yet, you can create one [here](https://www.ultraengine.com/community/register).

When you sign into your account in the application, it will look like this:

The **Projects** tab displays a list of your projects for easy access, and allows new project creation.

The **Install** tab allows you to select and install a version of the engine.

The **Community** tab contains links to community features you can access on our site.

The **Learn** tab contains links to documentation.

The **Billing** tab contains information about your account and plan.

The **Settings** tab contains various settings for the cient application.

When your subscription plan is active, you will be able to select a channel and install the engine. If you need to activate your plan, you can do so [here](https://www.ultraengine.com/community/store)

The default channel will contain the current stable build, which does not change. You can select a development channel and receive more frequent updates, but the releases will not be as thoroughly tested. If you want to switch channels, uninstall the engine and select a new channel to install.

Once the engine is installed you can create a new project in the **Projects** tab. Press the **Create** button, fill in the required information, and press okay to get started.

## Updating

The **Updates** tab will show an indicator when an update is available. After installing the update, you may see an icon indicating that some of your projects are out of date. This happens when the files in the project templates receive any changes. You can click the icon to see a list of all the files that have been modified. When you press the **OK** button to update the project, the new files will overwrite your existing project files. To prevent accidental data loss, a copy of your project file will be saved in the "backup" folder in your project directory.

You can view changes in text-based files by pressing the **Diff** button. This will open both versions of the file side-by-side and allow you to pick and choose which changes you want to insert. This feature requires [Visual Studio Code](https://code.visualstudio.com/download) to be installed, or you can set your own diff tool and command line in the **Settings** tab.

