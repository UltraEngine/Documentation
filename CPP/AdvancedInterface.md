# Advanced Application Interface

This page describes how to create a more complex application interface. The interface will consist of a main panel with a viewport and a text console, as well as a side panel divided into several tabbed panels. We will add some simple behavior to our application to demonstrate how a real application can be programmed. We will also add a child window with a few settings and show how to change the focus of the application to guide the user's actions.

## Application Layout

The first step is to divide our application up into a series of panels. The layout for each panel will be adjusted, for resizing and DPI scaling. We will color each panel separately so we can easily see what our application layout looks like.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

const int TOOLBARHEIGHT = 48; 
const int STATUSBARHEIGHT = 32;
const int SIDEPANELWIDTH = 300;
const int CONSOLEHEIGHT = 120;

int main(int argc, const char* argv[])
{
	//Get displays
	auto displays = GetDisplays();

	//Create window
	auto mainwindow = CreateWindow("Ultra App Kit", 0, 0, 1024, 768, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR | WINDOW_RESIZABLE);
	mainwindow->SetMinSize(800, 600);

	//Create user interface
	auto ui = CreateInterface(mainwindow);
	iVec2 sz = ui->root->ClientSize();

	//-------------------------------------------------------
	// Create main menu
	//-------------------------------------------------------
	
	auto mainmenu = CreateMenu("", ui->root);
	mainmenu->SetColor(0, 1, 1);

	//-------------------------------------------------------
	// Create toolbar
	//-------------------------------------------------------

	auto toolbar = CreatePanel(0, mainmenu->size.y, sz.x, TOOLBARHEIGHT, ui->root);
	toolbar->SetLayout(1, 1, 1, 0);
	toolbar->SetColor(1, 1, 0);

	//-------------------------------------------------------
	// Create status bar
	//-------------------------------------------------------
		
	auto statusbar = CreatePanel(0, sz.y - STATUSBARHEIGHT, sz.x, STATUSBARHEIGHT, ui->root);
	statusbar->SetLayout(1, 1, 0, 1);
	statusbar->SetColor(0, 1, 0);

	//-------------------------------------------------------
	// Create main background panel
	//-------------------------------------------------------

	auto mainpanel = CreatePanel(0, toolbar->position.y + toolbar->size.y, sz.x, sz.y - toolbar->size.y - toolbar->position.y - statusbar->size.y, ui->root);
	mainpanel->SetLayout(1, 1, 1, 1);
	sz = mainpanel->ClientSize();
	mainpanel->SetColor(0, 0, 1);
	
	//-------------------------------------------------------
	// Create side panel
	//-------------------------------------------------------
	
	auto sidepanel = CreatePanel(sz.x - SIDEPANELWIDTH, 0, SIDEPANELWIDTH, sz.y, mainpanel);
	sidepanel->SetLayout(0, 1, 1, 1);
	sidepanel->SetColor(1, 0, 0);

	while (true)
	{
		const Event event = WaitEvent();
		switch (event.id)
		{
		case EVENT_WIDGETSELECT:
			break;
		case EVENT_WIDGETACTION:
			break;
		case EVENT_WINDOWCLOSE:
			if (event.source == mainwindow)
			{
				if (Confirm("Are you sure you want to quit?"))
				{
					return 0;
				}
			}
		}
	}
	return 0;
}
```

When we run this code we can see the user interface is divided into different regions. When we resize the window the panels stretch to cover the window client area.

<img src = 'https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/applayout.png' style = 'width:800px;' />

## Build the Menu

We will now add items to the main menu. The main menu will contain four sub-menus called **File**, **Edit**, **View**, **Tools**, and **Help**. Each sub-menu will contain various menu items. The **File** menu will also contain a sub-menu of its own where we can display a list of recently opened files.

Replace the menu creation block of code with the code below:

```c++
	//-------------------------------------------------------
	// Create main menu
	//-------------------------------------------------------

	auto mainmenu = CreateMenu("", ui->root);
	
	//File menu
	auto menu_file = CreateMenu("File", mainmenu);
	CreateMenu("New", menu_file);
	CreateMenu("", menu_file);
	auto menu_open = CreateMenu("Open", menu_file);
	auto menu_save = CreateMenu("Save", menu_file);
	auto menu_saveas = CreateMenu("Save as...", menu_file);
	CreateMenu("", menu_file);
	auto menu_recentfiles = CreateMenu("Recent files", menu_file);
	array<shared_ptr<Widget>, 10> menu_recentfile;
	for (int n = 0; n < menu_recentfile.size(); ++n)
	{
		menu_recentfile[n] = CreateMenu("Recent file " + String(n + 1), menu_recentfiles);
	}
	CreateMenu("", menu_file);
	auto menu_exit = CreateMenu("Exit", menu_file);

	//Edit menu
	auto menu_edit = CreateMenu("Edit", mainmenu);
	CreateMenu("Undo", menu_edit);
	CreateMenu("Redo", menu_edit);
	CreateMenu("", menu_edit);
	CreateMenu("Cut", menu_edit);
	CreateMenu("Copy", menu_edit);
	CreateMenu("Past", menu_edit);
	CreateMenu("", menu_edit);
	CreateMenu("Select all", menu_edit);
	CreateMenu("Select none", menu_edit);
	CreateMenu("Invert selection", menu_edit);

	//View menu
	auto menu_view = CreateMenu("View", mainmenu);
	auto menu_perspective = CreateMenu("Perspective", menu_view);
	auto menu_top = CreateMenu("XZ - Top", menu_view);
	auto menu_side = CreateMenu("XZ - Side", menu_view);
	auto menu_front = CreateMenu("XY - Front", menu_view);
	menu_perspective->SetState(true);

	//Tools menu
	auto menu_tools = CreateMenu("Tools", mainmenu);
	auto menu_options = CreateMenu("Options", menu_tools);

	//Help menu
	auto menu_help = CreateMenu("Help", mainmenu);
	auto menu_helpcontents = CreateMenu("Help Contents", menu_help);
	auto menu_about = CreateMenu("About", menu_help);
```

When we run the program we can see an interactive menu with many items.

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/appmenu.png' style = 'width:800px;' />

We can add some interactivity to our application to perform various actions when different menu items are selected by the user.

Replace the EVENT_WIDGETACTION case statement in the main loop with the code below and run the program:

```c++
		case EVENT_WIDGETACTION:
			if (event.source == menu_exit)
			{
				EmitEvent(EVENT_WINDOWCLOSE, mainwindow);
			}
			else if (event.source == menu_open)
			{
				RequestFile("Open File");
			}
			else if (event.source == menu_save or event.source == menu_saveas)
			{
				RequestFile("Save File", "", "All Files", 0, true);
			}
			else if (event.source == menu_helpcontents)
			{
				RunFile("https://www.ultraengine.com/learn");
			}
			else if (event.source == menu_about)
			{
				Notify("Ultra App Kit");
			}
			else if (event.source == menu_perspective or event.source == menu_top or event.source == menu_side or event.source == menu_front)
			{
				menu_perspective->SetState(WIDGETSTATE_UNSELECTED);
				menu_top->SetState(WIDGETSTATE_UNSELECTED);
				menu_side->SetState(WIDGETSTATE_UNSELECTED);
				menu_front->SetState(WIDGETSTATE_UNSELECTED);
				event.source->As<Widget>()->SetState(WIDGETSTATE_SELECTED);
			}
			break;
```

We can observe the following behavior:
- When the **Open file** menu item is selected a file open dialog will be shown.
- When the **Save** or **Save as** menu item is selected a file save dialog will be shown.
- When any of the menu items in the **View** sub-menu are selected, that item will display a checkmark next to the menu text.
- When the **Help Contents** menu item is selected, a web page will be opened in the system web browser.
- When the **About** menu item is selected, a notification box will be displayed.
- When the **Exit** menu item is selected, a confirmation dialog will be shown, and the program will end if the user clicks OK.
 
Note that the event evaluation code emits a WINDOWCLOSE event when the **Exit** menu item is selected. This event is then detected and evaluated as if the user had actually closed the window. This allows us to reuse the same code. If we wish to change the behavior in the future, we only have to modify a single block of code.

## Build the Toolbar

The toolbar will contain a row of buttons that will provide quick access to functionality of commonly used menu items. In this example, we will use Emojis for our toolbar button icons, but in your application you may wish to use [SVG vector images](Widget_SetIcon) instead.

Replace the toolbar creation code with the code below. Note that the strings are preceeded by "L", indicating that a wide string should be used, in order to support the special unicode characters.

```c++
	//-------------------------------------------------------
	// Create toolbar
	//-------------------------------------------------------

	auto toolbar = CreatePanel(0, mainmenu->size.y, sz.x, TOOLBARHEIGHT, ui->root);
	toolbar->SetLayout(1, 1, 1, 0);
	int x = 4, y = 4;
	auto toolbarbutton_new = CreateButton(L"🗎", x, y, TOOLBARHEIGHT - 8, TOOLBARHEIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_new->SetFontScale(2);
	x += TOOLBARHEIGHT;

	auto toolbarbutton_open = CreateButton(L"📁", x, y, TOOLBARHEIGHT - 8, TOOLBARHEIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_open->SetFontScale(2);
	x += TOOLBARHEIGHT;

	auto toolbarbutton_save = CreateButton(L"🖫", x, y, TOOLBARHEIGHT - 8, TOOLBARHEIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_save->SetFontScale(2);
	x += TOOLBARHEIGHT;

	auto toolbarbutton_options = CreateButton(L"⚙", x, y, TOOLBARHEIGHT - 8, TOOLBARHEIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_options->SetFontScale(2);
	x += TOOLBARHEIGHT;

	auto toolbarbutton_help = CreateButton(L"?", x, y, TOOLBARHEIGHT - 8, TOOLBARHEIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_help->SetFontScale(2);
```

Rather than re-code all the functionality of the menu items, we can just emit new events when a toolbar button is pressed, and trick the program into thinking the associated menu item was selected. Add this code in the EVENT_WIDGETACTION case statement in the main loop and run the program:

```c++
			else if (event.source == toolbarbutton_open)
			{
				EmitEvent(EVENT_WIDGETACTION, menu_open);
			}
			else if (event.source == toolbarbutton_save)
			{
				EmitEvent(EVENT_WIDGETACTION, menu_save);
			}
			else if (event.source == toolbarbutton_options)
			{
				EmitEvent(EVENT_WIDGETACTION, menu_options);
			}
			else if (event.source == toolbarbutton_help)
			{
				EmitEvent(EVENT_WIDGETACTION, menu_helpcontents);
			}
```

You can now activate the menu items by pressing the equivalent toolbar button. The **Options** menu item doesn't do anything yet, but when we add this functionality it will be automatically triggered when the associated toolbar button is pressed.

At this point the program will look like this:

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/apptoolbar.png' style = 'width:800px;' />

## Build the Status Bar

We're going to make a simple status bar with a single label and some interaction. Replace the statusbar creation code with the code below:

```c++
	//-------------------------------------------------------
	// Create status bar
	//-------------------------------------------------------

	auto statusbar = CreatePanel(0, sz.y - STATUSBARHEIGHT, sz.x, STATUSBARHEIGHT, ui->root);
	statusbar->SetLayout(1, 1, 0, 1);
	auto statusbarlabel_view = CreateLabel("Perspective", 4, 0, 300, statusbar->size.y, statusbar, LABEL_LEFT | LABEL_MIDDLE);
```

Now find the code in the EVENT_WIDGETACTION case statement, in the main loop, that evaluates events generated by the user selecting the menu items in the **View** sub-menu. Replace it with this code and run the program:

```c++
			else if (event.source == menu_perspective or event.source == menu_top or event.source == menu_side or event.source == menu_front)
			{
				menu_perspective->SetState(WIDGETSTATE_UNSELECTED);
				menu_top->SetState(WIDGETSTATE_UNSELECTED);
				menu_side->SetState(WIDGETSTATE_UNSELECTED);
				menu_front->SetState(WIDGETSTATE_UNSELECTED);
				auto menuitem = event.source->As<Widget>();
				menuitem->SetState(WIDGETSTATE_SELECTED);
				statusbarlabel_view->SetText(menuitem->text);
			}
```

The status bar text will now update to match the current selected view mode in the window menu.

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/app_statusbar.png' style = 'width:800px;' />

## Build the Side Panel

Now we will add a tabbed panel into the side panel and populate it with various widgets. Replace the side panel creation code with the code below and run the program. A tabbed panel will appear with two tabs named **Objects** and **Scene**.

```c++
	//-------------------------------------------------------
	// Create side panel
	//-------------------------------------------------------	
	
	auto sidepanel = CreatePanel(sz.x - SIDEPANELWIDTH, 0, SIDEPANELWIDTH, sz.y, mainpanel);
	sidepanel->SetLayout(0, 1, 1, 1);
	auto tabber = CreateTabber(0, 0, SIDEPANELWIDTH, sz.y, sidepanel);
	tabber->SetLayout(1, 1, 1, 1);
	tabber->AddItem("Objects", true);
	tabber->AddItem("Scene");

	//Object panel
	sz = tabber->ClientSize();
	auto objectpanel = CreatePanel(0, 0, sz.x, sz.y, tabber);
	objectpanel->SetLayout(1, 1, 1, 1);
	tabber->items[0].extra = objectpanel;

	//Scene panel
	auto scenepanel = CreatePanel(0, 0, sz.x, sz.y, tabber);
	scenepanel->Hide();
	scenepanel->SetLayout(1, 1, 1, 1);
	tabber->items[1].extra = scenepanel;
```

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/app_tabber.png' style = 'width:800px;' />

Replace the EVENT_WIDGETSELECT case statement with the code below. This will show and hide the scene and object panel depending on which tab is selected. You can change the color of the objectpanel or scenepanel widget to verify that this working.

```c++
		case EVENT_WIDGETSELECT:
			if (event.source == tabber)
			{
				for (int n = 0; n < tabber->items.size(); ++n)
				{
					if (tabber->items[n].extra)
					{
						auto panel = tabber->items[n].extra->As<Widget>();
						if (n == event.data)
						{
							panel->Show();
						}
						else
						{
							panel->Hide();
						}
					}
				}
			}
			break;
```

Finally, we can add some code that will create a lot of widgets in the scene and object panels. Add the code below into your program, right after the sidepanel creation code:

```c++
x = 8;
	y = 12;

	CreateLabel("Category:", x, y, 200, 30, objectpanel);
	y += 24;
	auto objectcategorybox = CreateComboBox(x, y, sz.x - x * 2, 30, objectpanel);
	objectcategorybox->SetLayout(1, 1, 1, 0);
	objectcategorybox->AddItem("Primitives", true);
	objectcategorybox->AddItem("Extended primitives");
	objectcategorybox->AddItem("Cameras");
	objectcategorybox->AddItem("Lights");
	objectcategorybox->AddItem("Splines");
	y += 44;

	CreateLabel("Object:", x, y, 200, 30, objectpanel);
	y += 24;
	auto objectbox = CreateComboBox(x, y, sz.x - x * 2, 30, objectpanel);
	objectbox->SetLayout(1, 1, 1, 0);
	objectbox->AddItem("Box", true);
	objectbox->AddItem("Wedge");
	objectbox->AddItem("Cylinder");
	objectbox->AddItem("Sphere");
	y += 44;

	x = 80;
	CreateButton("Create", x, y, sz.x - 2 * x, 28, objectpanel);

	x = 8;
	y = 12;
	auto scenebrowser = CreateTreeView(x, y, sz.x - 2 * x, 400 - y, scenepanel);
	scenebrowser->SetLayout(1, 1, 1, 1);
	auto node = scenebrowser->root->AddNode("Scene");
	node->Expand();
	node->AddNode("Box 1");
	node->AddNode("Box 2");
	node->AddNode("Box 3");
	y += scenebrowser->size.y + x;

	auto propertiespanel = CreatePanel(x, y, sz.x, sz.y - y, scenepanel);
	propertiespanel->SetLayout(1, 1, 0, 1);

	y = 8;
	CreateLabel("Name:", x, y + 4, 60, 30, propertiespanel);
	auto widget_name = CreateTextField(x * 2 + 60, y, sz.x - 4 * x - 60, 30, propertiespanel);
	widget_name->SetText("Box 1");
	y += 40;
	 
	CreateLabel("Value:", x, y + 4, 60, 30, propertiespanel);
	CreateSlider(x * 2 + 60, y, sz.x - 4 * x - 60, 30, propertiespanel, SLIDER_HORIZONTAL | SLIDER_TRACKBAR);
	y += 40;
```

Our example program is starting to look like a real application now:

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/app_tabs.gif' style = 'width:800px;' />

## Build the Main Panel

We're now going to add a program console and a simulated viewport to the main panel. The viewport could be a window that uses [OpenGL rendering](OpenGL.md), a [3D engine](Leadwerks.md), or just a panel that [displays an image](Widget_SetPixmap.md). Since we are not building a real application, we will just use a panel with a black background.

Replace the main panel creation code with this:

```c++
	//-------------------------------------------------------
	// Create main panel
	//-------------------------------------------------------

	auto mainpanel = CreatePanel(0, toolbar->position.y + toolbar->size.y, sz.x, sz.y - toolbar->size.y - toolbar->position.y - statusbar->size.y, ui->root);
	mainpanel->SetLayout(1, 1, 1, 1);
	sz = mainpanel->ClientSize();
	
	//Create console
	auto console = CreateTextArea(4, mainpanel->size.y - CONSOLEHEIGHT, mainpanel->size.x - SIDEPANELWIDTH - 8, CONSOLEHEIGHT - 28 - 4, mainpanel);
	console->SetLayout(1, 1, 0, 1);
	console->SetText("Starting program...");
	auto widget_input = CreateTextField(4, mainpanel->size.y - 28, mainpanel->size.x - SIDEPANELWIDTH - 8, 28, mainpanel, TEXTFIELD_ENTERKEYACTIONEVENT);
	widget_input->SetLayout(1, 1, 0, 1);

	//Main viewport
	auto mainviewport = CreatePanel(4, 4, mainpanel->size.x - SIDEPANELWIDTH - 8, mainpanel->size.y - 8 - CONSOLEHEIGHT, mainpanel, PANEL_BORDER);
	mainviewport->SetLayout(1, 1, 1, 1);
	mainviewport->SetColor(0, 0, 0);
```

Add this code into the EVENT_WIDGETACTION case statement in the main loop, to handle console text input events:

```c++
			else if (event.source == widget_input)
			{
				if (!widget_input->text.empty())
				{
					console->AddText("\n" + widget_input->text);
					widget_input->SetText("");
				}
				widget_input->Activate();
			}
```

The program will now appear like the image below. If we enter some text in the console text field and press the enter key, it will be added to the text area:

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/app_console.png' style = 'width:800px;' />

## Options Window

The last feature we will add demonstrates how to use multiple windows in an application and guide the user's actions. Add the code below anywhere after the main window is created. Note that the window styles include the WINDOW_HIDDEN style, so the window will be invisible until it is shown.

```c++
	//Options window
	auto optionswindow = CreateWindow("Options",0,0,400,500,mainwindow, WINDOW_HIDDEN | WINDOW_TITLEBAR | WINDOW_CENTER);
	auto optionsui = CreateInterface(optionswindow);
	sz = optionsui->root->ClientSize(); 

	auto button_option1 = CreateButton("Option 1", x, y, 300, 30, optionsui->root, BUTTON_CHECKBOX);
	button_option1->SetState(WIDGETSTATE_SELECTED);
	y += 32;
	auto button_option2 = CreateButton("Option 2", x, y, 300, 30, optionsui->root, BUTTON_RADIO);
	button_option2->SetState(WIDGETSTATE_SELECTED);
	y += 32;
	auto button_option3 = CreateButton("Option 3", x, y, 300, 30, optionsui->root, BUTTON_RADIO);

	auto button_applyoptions = CreateButton("OK", sz.x - 2 * (8 + 80), sz.y - 8 - 30, 80, 30, optionsui->root, BUTTON_OK);
	auto button_closeoptions = CreateButton("Cancel", sz.x - 8 - 80, sz.y - 8 - 30, 80, 30, optionsui->root, BUTTON_CANCEL);
```

We need to add two blocks of code to handle events for the options window. In the EVENT_WIDGETACTION case statement, insert this code. Note that pressing the **OK** and **Cancel** buttons will both result in a WINDOWCLOSE event being emitted:

```c++
			else if (event.source == menu_options)
			{
				optionswindow->Show();
				optionswindow->Activate();
				mainwindow->Disable();
			}
			else if (event.source == button_applyoptions or event.source == button_closeoptions)
			{
				EmitEvent(EVENT_WINDOWCLOSE, optionswindow);
			}
```

In the EVENT_WINDOWCLOSE case statement, add this code.

```c++
			else if (event.source == optionswindow)
			{
				mainwindow->Enable();
				mainwindow->Activate();
				optionswindow->Hide();
			}
```

When we run the program, we can open the options window by selecting the **Tools > Options** menu item. We already set up the **Options** toolbar button to emit a WIDGETACTION event when it is pressed, so it will work as well. When the options window is open, the main window is disabled and cannot be interacted with. When the user pressed the **OK** or **Cancel** buttons the options window will be hidden and the main window can be interacted with again.

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/app_options.png' style = 'width:800px;' />

You can download the complete source code for this example [here](https://raw.githubusercontent.com/Leadwerks/Documentation/master/CPP/Advaned%20Interface.cpp).
