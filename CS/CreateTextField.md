# CreateTextField

The textfield widget is an editable input box. It will emit a WIDGETACTION event if the text changes and the widget loses the focus or the enter key is pressed. If the READONLY style is used the widget text will not be editable. If the PASSWORD style is used the widget text will appear as a series of dots.

## Syntax

- [Widget](Widget.md) **CreateTextField**(int x, int y, int width, int height, [Widget](Widget.md) parent, TextField style = TextField.TEXTFIELD_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | textfield style, can be any combination of TextField.TEXTFIELD_DEFAULT, TextField.TEXTFIELD_READONLY, TextField.TEXTFIELD_PASSWORD, TextField.TEXTFIELD_TEXTCHANGEACTIONEVENT, TextField.TEXTFIELD_LOSEFOCUSACTIONEVENT, and TextField.TEXTFIELD_ENTERKEYACTIONEVENT |

## Remarks

The TextField.TEXTFIELD_DEFAULT style flag is equal to TextField.TEXTFIELD_LOSEFOCUSACTIONEVENT + TextField.TEXTFIELD_ENTERKEYACTIONEVENT.

## Example

![CreateTextField](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTextField.png)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create User Interface
        var ui = Interface.Create(window);

        //Create widget
        var sz = ui.root.ClientSize();
        var textfield = Widget.CreateTextField(20, 20, 300, 32, ui.root);
        textfield.SetText("Here is some text!");
        textfield.SelectText(0,textfield.text.Length);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case Event.EVENT_WIDGETACTION:
                    if (ev.source == textfield)
                    {
                        Console.WriteLine(ev.extra.As<WString>().Value);
                    }
                    break;        
                case Event.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```