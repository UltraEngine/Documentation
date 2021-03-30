# CreateLabel #

The label widget displays a read-only block of text.

## Syntax ##

- shared_ptr<[Widget](Widget.md)\> **CreateLabel**(const [WString](WString.md)& text, const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const ButtonStyle = LABEL_DEFAULT)

|Parameter|Description|
|---|---|
| text | widget text |
| x | widget x position |
| y | widget y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional button style, can be any combination of LABEL_LEFT. LABEL_RIGHT, LABEL_CENTER, LABEL_TOP, LABEL_MIDDLE, LABEL_BOTTOM, and LABEL_BORDER |

## Example ##
```c++
#include "pch.h"

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
    auto label1 = CreateLabel("Label", 20, 20, 120, 30, ui->root);
    auto label2 = CreateLabel("Border Label", 20, 50, 120, 30, ui->root, LABEL_BORDER | LABEL_CENTER | LABEL_MIDDLE);

    while (window->Closed() == false)
    {
        WaitEvent();
    }
    return 0;
}
```