# Advanced Application Interface

This page describes how to create a more complex application interface. The interface will consist of a main panel with a viewport and a text console, as well as a side panel divided into several tabbed panels. We will add some simple behavior to our application to demonstrate how a real application can be programmed. We will also add a child window with a few settings and show how to change the focus of the application to guide the user's actions.

## Application Layout

The first step is to divide our application up into a series of panels. The layout for each panel will be adjusted, for resizing and DPI scaling. We will color each panel separately so we can easily see what our application layout looks like.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

const int TOOLBARHeIGHT = 48;
const int STATUSBARHEIGHT = 32;
const int SIDEPANELWIDTH = 300;

int main(int argc, const char* argv[])
{
	//Get displays
	auto displays = GetDisplays();

	//Create window
	auto mainwindow = CreateWindow("Ultra App Kit", 0, 0, 1024, 768, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR | WINDOW_RESIZABLE);

	//Create user interface
	auto ui = CreateInterface(mainwindow);
	iVec2 sz = ui->root->ClientSize();

	//Create main menu
	auto mainmenu = CreateMenu("", ui->root);
	auto menu_file = CreateMenu("File", mainmenu);
	auto menu_edit = CreateMenu("Edit", mainmenu);
	auto menu_tools = CreateMenu("Tools", mainmenu);
	auto menu_help = CreateMenu("Help", mainmenu);

	//Create toolbar
	auto toolbar = CreatePanel(0, mainmenu->size.y, sz.x, TOOLBARHeIGHT, ui->root);
	toolbar->SetLayout(1, 1, 1, 0);
	toolbar->SetColor(1, 0, 0);

	//Create status bar
	auto statusbar = CreatePanel(0,sz.y - STATUSBARHEIGHT,sz.x, STATUSBARHEIGHT,ui->root);
	statusbar->SetLayout(1, 1, 0, 1);
	statusbar->SetColor(0, 1, 1);

	//Create main background panel
	auto mainpanel = CreatePanel(0, toolbar->position.y + toolbar->size.y, sz.x, sz.y - toolbar->size.y - toolbar->position.y - statusbar->size.y, ui->root);
	mainpanel->SetLayout(1, 1, 1, 1);
	sz = mainpanel->ClientSize();
	mainpanel->SetColor(0, 1, 0);

	//Craete side panel
	auto sidepanel = CreatePanel(sz.x - SIDEPANELWIDTH, 0, SIDEPANELWIDTH, sz.y, mainpanel);
	sidepanel->SetLayout(0, 1, 1, 1);
	sidepanel->SetColor(1, 1, 0);

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
			if (event.source == mainwindow) return 0;
			break;
		}
	}
	return 0;
}
```

## Final Version

<img src='https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/application.jpg' style = 'width:800px;' />

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

const int TOOLBARHeIGHT = 48;
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

	//Create main menu
	auto mainmenu = CreateMenu("", ui->root);
	
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

	auto menu_view = CreateMenu("View", mainmenu);
	auto menu_perspective = CreateMenu("Perspective", menu_view);
	auto menu_top = CreateMenu("XZ - Top", menu_view);
	auto menu_side = CreateMenu("XZ - Side", menu_view);
	auto menu_front = CreateMenu("XY - Front", menu_view);
	menu_perspective->SetState(true);

	auto menu_tools = CreateMenu("Tools", mainmenu);
	auto menu_options = CreateMenu("Options", menu_tools);

	auto menu_help = CreateMenu("Help", mainmenu);
	auto menu_helpcontents = CreateMenu("Help Contents", menu_help);
	auto menu_about = CreateMenu("About", menu_help);

	//Create toolbar
	auto toolbar = CreatePanel(0, mainmenu->size.y, sz.x, TOOLBARHeIGHT, ui->root);
	toolbar->SetLayout(1, 1, 1, 0);
	//toolbar->SetColor(1, 0, 0);
	int x = 4, y = 4;
	auto toolbarbutton_new = CreateButton(L"🗎", x, y, TOOLBARHeIGHT - 8, TOOLBARHeIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_new->SetFontScale(2);
	x += TOOLBARHeIGHT;

	auto toolbarbutton_open = CreateButton(L"📁", x, y, TOOLBARHeIGHT - 8, TOOLBARHeIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_open->SetFontScale(2);
	x += TOOLBARHeIGHT;

	auto toolbarbutton_save = CreateButton(L"🖫", x, y, TOOLBARHeIGHT - 8, TOOLBARHeIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_save->SetFontScale(2);
	x += TOOLBARHeIGHT;

	auto toolbarbutton_options = CreateButton(L"⚙", x, y, TOOLBARHeIGHT - 8, TOOLBARHeIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_options->SetFontScale(2);
	x += TOOLBARHeIGHT;

	auto toolbarbutton_help = CreateButton(L"?", x, y, TOOLBARHeIGHT - 8, TOOLBARHeIGHT - 8, toolbar, BUTTON_TOOLBAR);
	toolbarbutton_help->SetFontScale(2);

	//Create status bar
	auto statusbar = CreatePanel(0, sz.y - STATUSBARHEIGHT, sz.x, STATUSBARHEIGHT, ui->root);
	statusbar->SetLayout(1, 1, 0, 1);
	auto statusitem = CreateTextField(2, 2, 300, STATUSBARHEIGHT - 4, statusbar, TEXTFIELD_READONLY);
	statusitem->SetText("Press F1 for help");
	statusitem->SetColor(ui->root->color[WIDGETCOLOR_BACKGROUND], WIDGETCOLOR_SUNKEN);

	statusitem = CreateTextField(300 + 2 * 2, 2, 150, STATUSBARHEIGHT - 4, statusbar, TEXTFIELD_READONLY);
	statusitem->SetText("Zoom: 1.0");
	statusitem->SetColor(ui->root->color[WIDGETCOLOR_BACKGROUND], WIDGETCOLOR_SUNKEN);

	statusitem = CreateTextField(300 + 150 + 2 * 3, 2, 150, STATUSBARHEIGHT - 4, statusbar, TEXTFIELD_READONLY);
	statusitem->SetText("Grid size: 32 cm");
	statusitem->SetColor(ui->root->color[WIDGETCOLOR_BACKGROUND], WIDGETCOLOR_SUNKEN);

	statusitem = CreateTextField(300 + 150 * 2 + 2 * 4, 2, 150, STATUSBARHEIGHT - 4, statusbar, TEXTFIELD_READONLY);
	statusitem->SetText("0 objects selected");
	statusitem->SetColor(ui->root->color[WIDGETCOLOR_BACKGROUND], WIDGETCOLOR_SUNKEN);
	statusitem->SetLayout(1, 1, 1, 1);

	//Create main background panel
	auto mainpanel = CreatePanel(0, toolbar->position.y + toolbar->size.y, sz.x, sz.y - toolbar->size.y - toolbar->position.y - statusbar->size.y, ui->root);
	mainpanel->SetLayout(1, 1, 1, 1);
	sz = mainpanel->ClientSize();
	//mainpanel->SetColor(0, 1, 0);

	auto plugin = LoadPlugin("Plugins/FITextureLoader.dll");

	auto console = CreateTextArea(4, mainpanel->size.y - CONSOLEHEIGHT, mainpanel->size.x - SIDEPANELWIDTH - 8, CONSOLEHEIGHT - 28 - 4, mainpanel);
	console->SetLayout(1, 1, 0, 1);
	console->SetText("Starting program...");
	auto widget_input = CreateTextField(4, mainpanel->size.y - 28, mainpanel->size.x - SIDEPANELWIDTH - 8, 28, mainpanel, TEXTFIELD_ENTERKEYACTIONEVENT);
	widget_input->SetLayout(1, 1, 0, 1);

	auto mainviewport = CreatePanel(4, 4, mainpanel->size.x - SIDEPANELWIDTH - 8, mainpanel->size.y - 8 - CONSOLEHEIGHT, mainpanel, PANEL_BORDER);
	mainviewport->SetLayout(1, 1, 1, 1);
	mainviewport->SetColor(0, 0, 0);
	auto pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/viewport.jpg");
	mainviewport->SetPixmap(pixmap, PIXMAP_COVER);

	//Craete side panel
	auto sidepanel = CreateTabber(sz.x - SIDEPANELWIDTH, 0, SIDEPANELWIDTH, sz.y, mainpanel);
	sidepanel->SetLayout(0, 1, 1, 1);
	sidepanel->AddItem("Objects", true);
	sidepanel->AddItem("Scene");

	//Object panel
	sz = sidepanel->ClientSize();
	auto objectpanel = CreatePanel(0, 0, sz.x, sz.y, sidepanel);
	sidepanel->items[0].extra = objectpanel;

	objectpanel->SetLayout(1, 1, 1, 1);
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

	auto scenepanel = CreatePanel(0, 0, sz.x, sz.y, sidepanel);
	sidepanel->items[1].extra = scenepanel;
	scenepanel->Hide();
	scenepanel->SetLayout(1, 1, 1, 1);
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

	auto propertiespanel = CreatePanel(x, y, sz.x, sz.y - 400 - y, scenepanel);
	propertiespanel->SetLayout(1, 1, 0, 1);

	y = 8;
	CreateLabel("Name:", x, y + 4, 60, 30, propertiespanel);
	auto widget_name = CreateTextField(x * 2 + 60, y, sz.x - 2 * x - 60, 30, propertiespanel);
	widget_name->SetText("Box 1");
	y += 40;

	CreateLabel("Value:", x, y + 4, 60, 30, propertiespanel);
	CreateSlider(x * 2 + 60, y, sz.x - 2 * x - 60, 30, propertiespanel, SLIDER_HORIZONTAL | SLIDER_TRACKBAR);
	y += 40;

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

	while (true)
	{
		const Event event = WaitEvent();
		switch (event.id)
		{

		case EVENT_WIDGETSELECT:
			Print("SELECT");
			if (event.source == sidepanel)
			{
				for (int n = 0; n < sidepanel->items.size(); ++n)
				{
					if (sidepanel->items[n].extra)
					{
						auto panel = sidepanel->items[n].extra->As<Widget>();
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

		case EVENT_WIDGETACTION:
			if (event.source == menu_exit)
			{
				EmitEvent(EVENT_WINDOWCLOSE, mainwindow);
			}
			else if (event.source == widget_input)
			{
				if (!widget_input->text.empty())
				{
					console->AddText("\n" + widget_input->text);
					widget_input->SetText("");
				}
				widget_input->Activate();
			}
			else if (event.source == menu_open or event.source == toolbarbutton_open)
			{
				RequestFile("Open File");
			}
			else if (event.source == menu_save or event.source == menu_saveas or event.source == toolbarbutton_save)
			{
				RequestFile("Save File", "", "All Files", 0, true);
			}
			else if (event.source == menu_helpcontents or event.source == toolbarbutton_help)
			{
				RunFile("https://www.ultraengine.com/learn");
			}
			else if (event.source == menu_about)
			{
				Notify("Ultra App Kit");
			}
			else if (event.source == menu_options or event.source == toolbarbutton_options)
			{
				optionswindow->Show();
				optionswindow->Activate();
				mainwindow->Disable();
			}
			else if (event.source == menu_perspective or event.source == menu_top or event.source == menu_side or event.source == menu_front)
			{
				menu_perspective->SetState(WIDGETSTATE_UNSELECTED);
				menu_top->SetState(WIDGETSTATE_UNSELECTED);
				menu_side->SetState(WIDGETSTATE_UNSELECTED);
				menu_front->SetState(WIDGETSTATE_UNSELECTED);
				event.source->As<Widget>()->SetState(WIDGETSTATE_SELECTED);
			}
			else if (event.source == button_applyoptions or event.source == button_closeoptions)
			{
				EmitEvent(EVENT_WINDOWCLOSE, optionswindow);
			}
			break;

		case EVENT_WINDOWCLOSE:
			if (event.source == mainwindow)
			{
				if (Confirm("Are you sure you want to quit?"))
				{
					return 0;
				}
			}
			else if (event.source == optionswindow)
			{
				mainwindow->Enable();
				mainwindow->Activate();
				optionswindow->Hide();
			}
			break;
		}

		if (event.id == EVENT_WIDGETACTION or event.id == EVENT_WIDGETSELECT)
		{
			shared_ptr<Widget> widget;
			if (event.extra and event.data == 1) widget = event.extra->As<Widget>();
			if (widget == NULL) widget = event.source->As<Widget>();
			if (widget != NULL and !widget->text.empty())
			{
				console->AddText("\n" + widget->text);
			}
			if (widget->As<ComboBox>() != NULL)
			{
				console->AddText("\n" + widget->items[event.data].text);
			}
		}
	}
	return 0;
}
```
