# Create a File Browser

This page describes how to create a program that can browser a folder, display a list of files, and open files with the default program for that file type.

## Program Interface

We'll start by establishing the basic layout of the application interface. We will use a treeview widget on the left side of the window that is locked to the left edge, and a listbox widget in the remaining space on the right. The listbox will stretchin all directions when the window is resized.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Get the available displays
    auto displays = GetDisplays();

    // Create a window
    auto window = CreateWindow("File Browser", 0, 0, 1024, 768, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE | WINDOW_CENTER);

    // Create user interface
    auto ui = CreateInterface(window);
    iVec2 sz = ui->root->ClientSize();

    // Create folder browser widget
    auto folderbrowser = CreateTreeView(8, 8, 300, sz.y-15, ui->root);
    folderbrowser->SetLayout(1, 0, 1, 1);

    // Create file list widget
    auto filelist = CreateListBox(300+16, 8, sz.x - 300 - 8*3, sz.y - 16, ui->root);
    filelist->SetLayout(1, 1, 1, 1);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            if (ev.source == window) return 0;
            break;
        }
    }
    return 0;
}
```

When we run the code above here is the result:

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/filebrowser1.png' width='800px' />

## Populating the Folder Browser

Next we will add a function to load folders into the treeview. Add this code above the main function:
```c++
void PopulateTree(shared_ptr<Widget> node, const WString& path)
{
    auto dir = LoadDir(path);
    for (const auto& file : dir)
    {
        switch (FileType(path + "/" + file))
        {
        case 2:
            auto subnode = node->AddNode(file);
            PopulateTree(subnode, path + "/" + file);
            break;
        }
    }
}
```
Now add this line of code after the filebrowser treeview widget is created:
```c++
    //Load folder contents into treeview
    WString rootpath = GetPath(PATH_DOCUMENTS);
    PopulateTree(folderbrowser->root, rootpath);
```

When we run the resulting code, there is a pause while the contents of the Documents folder are loaded into the treeview. This may be quite slow depending on how many folders you have to load, but we will come back to optimize this design later.

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/filebrowser2.png' width='800px' />

Now we will add some event handling to make the behavior of our program more interesting. You can replace the entire while loop with this code. This will add a lot of interesting behaviors. When a treeview node is selected in the folder browser, the contents of that folder will be loaded and displayed in the file listbox. Double-clicking a treeview node will make it expand or collapse. Double-clicking on an item in the listbox will open the file with the default program for that file type.

```c++
    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETSELECT:

            // Load the folder contents and display in the file list
            if (ev.source == folderbrowser)
            {
                auto node = ev.extra->As<Widget>();
                WString path = GetNodePath(node);
                auto dir = LoadDir(rootpath + "/" + path);
                filelist->ClearItems();
                for (const WString& file : dir)
                {
                    if (FileType(rootpath + "/" + path + "/" + file) == 1)
                    {
                        filelist->AddItem(file);
                    }
                }
            }
            break;

        case EVENT_WIDGETACTION:
            
            // Toggle treeview nodes open and closed when they are double-clicked
            if (ev.source == folderbrowser)
            {
                auto node = ev.extra->As<Widget>();
                if (!node->kids.empty())
                {
                    if (node->Collapsed())
                    {
                        node->Expand();
                    }
                    else
                    {
                        node->Collapse();
                    }
                }
            }

            // Open a file with the default program when it is double-clicked
            if (ev.source == filelist)
            {
                auto node = folderbrowser->GetSelectedNode();
                WString path = GetNodePath(node);
                RunFile(rootpath + "/" + path + "/" + filelist->items[ev.data].text);
            }

            break;

        case EVENT_WINDOWCLOSE:

            // Exit the program when the window is closed
            if (ev.source == window) return 0;

            break;
        }
    }
```

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/filebrowser3.png' width='800px' />

## Optimization

At this point our program startup is quite slow because we are recursively loading the entire directory structure of the folder path we are browsing. It would be better if we only loaded the contents of folder we are currently browsing, and just loaded new directories as needed. However, in order to make treeview nodes expandable, they must have at least one child node. If we replace our PopulateTree function with the code below, it will do this.

```c++
void PopulateTree(shared_ptr<Widget> node, const WString& path)
{
    auto dir = LoadDir(path);
    for (const auto& file : dir)
    {
        switch (FileType(path + "/" + file))
        {
        case 2:
            auto subnode = node->AddNode(file);
            auto subdir = LoadDir(path + "/" + file);
            for (const auto& subfile : subdir)
            {
                if (FileType(path + "/" + file + "/" + subfile) == 2)
                {
                    subnode->AddNode("Loading...");
                    node->SetValue(1);
                    break;
                }
            }
            break;
        }
    }
}
```

When we run the program it will now start up much faster, but of course none of the subfolders are being loaded yet.

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/filebrowser4.png' width='800px' />

To handle folder loading we will add a new case inside the switch statement. We're going to use the [Widget::GetValue](Widget_GetValue) method to see if the folder has already been loaded. The widget value is not normally used with treeviews, but it provides a convenient way for us to store an extra parameter. By default it is equal to 0, so we can just use this as an indiction that the folder for the selected treeview node has not been loaded yet. After it is loaded we set the value to 1 so it won't get loaded again.

```c++
        case EVENT_WIDGETOPEN:
            if (ev.source == folderbrowser)
            {
                auto node = ev.extra->As<Widget>();
                if (node->GetValue() == 0)
                {
                    while (!node->kids.empty())
                    {
                        node->kids[0]->SetParent(NULL);
                    }
                    PopulateTree(node, rootpath + "/" + GetNodePath(node));
                    node->SetValue(1);
                }
            }
            break;
```

We also need to modify our node toggle code. Calling Widget::Expand will not emit an event, so we need to add these events ourselves.

```c++
            // Toggle treeview nodes open and closed when they are double-clicked
            if (ev.source == folderbrowser)
            {
                auto node = ev.extra->As<Widget>();
                if (!node->kids.empty())
                {
                    if (node->Collapsed())
                    {
                        node->Expand();
                        EmitEvent(EVENT_WIDGETOPEN, ev.source, 0, 0, 0, 0, 0, ev.extra);
                    }
                    else
                    {
                        node->Collapse();
                        EmitEvent(EVENT_WIDGETCLOSE, ev.source, 0, 0, 0, 0, 0, ev.extra);
                    }
                }
            }
```

Now when we run the code we have the best of both worlds. The program starts up quickly and we can browser the entire directory stucture, loading subfolders as we go.
