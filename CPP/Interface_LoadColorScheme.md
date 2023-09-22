# Interface::LoadColorScheme

This method loads a color scheme from a JSON file.

## Syntax

- bool **LoadColorScheme**(const [WString](WString.md)& path, const [LoadFlags](Constants.md#LoadFlags) flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load |
| flags | optional load flags |

## Returns

Returns true if the color scheme was successfully loaded, otherwise false is returned.

## Remarks

Color schemes are stored in JSON format and define an RGB color for various widget attributes:

```javascript
{
	"colorScheme": {
		"background": "#333333",
		"border": "#000000",
		"foreground": "#FFFFFF",
		"highlight": "#424242",
		"menuBorder": "#333333",
		"popup": "#1A1A1A",
		"raised": "#3B3B3B",
		"selectedText": "#FFFFFF",
		"selection": "#2979FF",
		"sliderArrow": "#686868",
		"sliderTrack": "#666666",
		"sliderTrackHovered": "#999999",
		"sunken": "#262626"
	}
}
```

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create widget
    iVec2 sz = ui->background->ClientSize();
    auto button_dark = CreateButton("Dark Theme", sz.x / 4 - 75, sz.y / 4 - 15, 150, 30, ui->background);
    auto button_light = CreateButton("Light Theme", sz.x / 4 * 3 - 75, sz.y / 4 - 15, 150, 30, ui->background);

    //Text area
    auto textarea = CreateTextArea(8,sz.y/2,sz.x-16,sz.y/2-8,ui->background);
    textarea->SetText(LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json"));

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == button_dark)
            {
                //Load dark color scheme
                ui->LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json");
                textarea->SetText(LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json"));
            }
            else if (ev.source == button_light)
            {
                //Load light color scheme
                ui->LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json");
                textarea->SetText(LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json"));
            }
            break;
        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            break;
        }
    }
    return 0;
}
```
