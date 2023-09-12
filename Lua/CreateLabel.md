# CreateLabel #

The label widget displays a read-only block of text.

## Syntax ##

```lua
-- shared_ptr<[Widget](Widget.md)> CreateLabel(const [WString](WString.md)& text, const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)> parent, const ButtonStyle = LABEL_DEFAULT)
```

### Parameters ###

|Parameter|Description|
|---|---|
| text | widget text |
| x | widget x position |
| y | widget y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional button style, can be any combination of LABEL_LEFT, LABEL_RIGHT, LABEL_CENTER, LABEL_TOP, LABEL_MIDDLE, LABEL_BOTTOM, and LABEL_BORDER |

## Example ##

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateLabel.png)

```lua
-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local label1 = CreateLabel("Label", 20, 20, 120, 30, ui.root)
local label2 = CreateLabel("Border Label", 20, 50, 120, 30, ui.root, LABEL_BORDER + LABEL_CENTER + LABEL_MIDDLE)

while window.Closed() == false do
    WaitEvent()
end
```