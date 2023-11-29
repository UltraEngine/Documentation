# Interface.LoadColorScheme

This method loads a color scheme from a JSON file.

## Syntax

- bool **LoadColorScheme**(string path, [LoadFlags](Constants.md#LoadFlags) flags = LOAD_DEFAULT)

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

```csharp
using System;
using Leadwerks;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = App.GetDisplays();

        //Create window
        var window = App.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = App.CreateInterface(window);

        //Create widget
        var sz = ui.background.ClientSize();
        var button_dark = App.CreateButton("Dark Theme", sz.x / 4 - 75, sz.y / 4 - 15, 150, 30, ui.background);
        var button_light = App.CreateButton("Light Theme", sz.x / 4 * 3 - 75, sz.y / 4 - 15, 150, 30, ui.background);

        //Text area
        var textarea = App.CreateTextArea(8, sz.y / 2, sz.x - 16, sz.y / 2 - 8, ui.background);
        textarea.SetText(App.LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json"));

        while (true)
        {
            var ev = App.WaitEvent();
            switch (ev.id)
            {
                case EventId.WidgetAction:
                    if (ev.source == button_dark)
                    {
                        //Load dark color scheme
                        ui.LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json");
                        textarea.SetText(App.LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/dark.json"));
                    }
                    else if (ev.source == button_light)
                    {
                        //Load light color scheme
                        ui.LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json");
                        textarea.SetText(App.LoadString("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json"));
                    }
                    break;
                case EventId.WindowClose:
                    if (ev.source == window)
                    {
                        return;
                    }
                    break;
            }
        }
    }
}
```
Note: The conversion of the `LoadString` function is incomplete, as there is no equivalent method in the provided information.