# CreateTextArea #

The text area widget is a read-only multiline text display. If the WORDWRAP style is used the text will be adjusted to fit in the horizontal space of the widget.

## Syntax ##

- Widget **CreateTextArea**(int x, int y, int width, int height, Widget parent, TextField style = TextField.TEXTAREA_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | textfield style, can be TextField.TEXTAREA_DEFAULT or TextField.TEXTAREA_WORDWRAP |

## Returns

Returns a new TextArea widget.

## Remarks

When the TextField.TEXTAREA_WORDWRAP style is used whitespace characters may be optimized for faster layout calculation.

## Example

![CreateTextArea](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTextArea.png)

```csharp
using System;
using Leadwerks;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Graphics.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 640, 480, displays[0], WindowStyle.TITLEBAR | WindowStyle.RESIZABLE);

        //Create User Interface
        var ui = UserInterface.Create(window);

        //Create widget
        var sz = ui.root.ClientSize;
        var textarea = Widget.CreateTextArea(10, 10, sz.x - 20, sz.y - 20, ui.root, TextFieldStyle.TEXTAREA_WORDWRAP);

        var s = "Night was falling now, and as I recalled what Akeley had written me about those earlier nights \
I shuddered to think there would be no moon. Nor did I like the way the farmhouse nestled in the lee of that\
colossal forested slope leading up to the Dark Mountain’s unvisited crest. With Akeley’s permission I lighted a small oil lamp,\
 turned it low, and set it on a distant bookcase beside the ghostly bust of Milton; but afterward I was sorry I had done so, for \
it made my host’s strained, immobile face and listless hands look damnably abnormal and corpselike. He seemed half-incapable of motion, \
though I saw him nod stiffly once in a while.";

        textarea.SetText(s);
        textarea.SetLayout(1,1,1,1);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case Event.WINDOWCLOSE:
                    return;
            }
        }
    }
}
```
