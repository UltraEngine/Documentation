# CreateTextField

The textfield widget is an editable input box. It will emit a WIDGETACTION event if the text changes and the widget loses the focus or the enter key is pressed. If the READONLY style is used the widget text will not be editable. If the PASSWORD style is used the widget text will be masked.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateTextField**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const TextField style = TEXTFIELD_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | textfield style, can be any combination of TEXTFIELD_DEFAULT, TEXTFIELD_READONLY, TEXTFIELD_PASSWORD, TEXTFIELD_TEXTCHANGEACTIONEVENT, TEXTFIELD_LOSEFOCUSACTIONEVENT, and TEXTFIELD_ENTERKEYACTIONEVENT |

## Remarks

The TEXTFIELD_DEFAULT style flag is equal to TEXTFIELD_LOSEFOCUSACTIONEVENT + TEXTFIELD_ENTERKEYACTIONEVENT.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTextField.png)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto textfield = CreateTextField(20, 20, 300, 32, ui->root);
    textfield->SetText("Here is some text!");
    textfield->SelectText(0,textfield->text.size());

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == textfield)
            {
                Print(*(ev.extra->As<WString>().get()));
            }
            break;        
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
