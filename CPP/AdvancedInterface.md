# Advanced Application Interface

This page describes how to create a more complex application interface.

We will color each panel separately so we can easily see what our application layout looks like.

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
