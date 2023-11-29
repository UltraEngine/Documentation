# Custom Widgets

You can create new types of widgets in C# by extending the base [Widget](Widget.md) class. The widget's behavior is controlled by overriding the Widget class methods. Drawing is accomplished by adding `WidgetBlock` objects to the `blocks` member.

The following methods can be overridden to control custom widget behavior:

| Name | Description |
|---|---|
| [Draw](Widget_Draw.md) | called each time the widget is painted |
| [DoubleClick](Widget_DoubleClick.md) | called when a mouse button is clicked twice in rapid succession |
| [GainFocus](Widget_GainFocus.md) | called when the widget is selected |
| [KeyChar](Widget_KeyChar.md) | called when a keyboard character is entered |
| [KeyDown](Widget_KeyDown.md) | called when a keyboard key is pressed |
| [KeyUp](Widget_KeyUp.md) | called when a keyboard key is released |
| [LoseFocus](Widget_LoseFocus.md) | called when the widget is deselected |
| [MouseDown](Widget_MouseDown.md) | called when a mouse button is pressed |
| [MouseEnter](Widget_MouseEnter.md) | called when the mouse cursor enters the active window bounds |
| [MouseLeave](Widget_MouseLeave.md) | called when the mouse cursor leaves the active window bounds |
| [MouseMove](Widget_MouseMove.md) | called whenever the mouse moves, with coordinates relative to the active window |
| [MouseUp](Widget_MouseUp.md) | called when a mouse button is released |
| [MouseWheel](Widget_MouseWheel.md) | called when the mouse wheel turns |
| [TripleClick](Widget_TripleClick.md) | called when a mouse button is clicked rapidly three times |

## Example

```csharp
using UltraEngine;

//Declare new style constants
public enum CustomWidgetStyle
{
    CUSTOMWIDGET_DEFAULT = 0
}

//Declare new widget class
public class CustomWidget : Widget
{
    //Custom members
    bool hover;

    protected override bool Initialize(WString text, int x, int y, int width, int height, Widget parent, int style)
    {
        return base.Initialize(text, x, y, width, height, parent, style);
    }

    //Called when the mouse moves if this widget has the focus
    protected override void MouseMove(int x, int y) {}

    //Called when the mouse cursor enters the widget bounds
    protected override void MouseEnter(int x, int y)
    {
        hover = true;
        Redraw();
    }

    //Called when the mouse cursor leaves the widget bounds
    protected override void MouseLeave(int x, int y)
    {
        hover = false;
        Redraw();
    }

    //Called when the mouse button is pressed
    protected override void MouseDown(MouseButton button, int x, int y)
    {
        if (button == MouseButton.MOUSE_LEFT) EmitEvent(EVENT_WIDGETACTION, Self());
    }

    //Called when the mouse button is released
    protected override void MouseUp(MouseButton button, int x, int y) {}

    //Called when another widget becomes selected
    protected override void LoseFocus() {}

    //Called when mouse double-click occurs
    protected override void DoubleClick(MouseButton button, int x, int y) {}

    //Called when mouse triple-click occurs
    protected override void TripleClick(MouseButton button, int x, int y) {}

    //Called when widget is selected
    protected override void GainFocus() {}

    //Called when key is pressed
    protected override void KeyDown(KeyCode key) {}

    //Called when key is released
    protected override void KeyUp(KeyCode key) {}

    //Called for each keydown event
    protected override void KeyChar(int keychar) {}

    //Called when mouse wheel turns and mouse is hovered over this widget
    protected override void MouseWheel(int delta, int x, int y) {}

    //Called each time the widget is redrawn
    protected override void Draw(int x, int y, int width, int height)
    {
        blocks.Clear();
        Vec4 color = new Vec4(1, 0, 0, 1);
        if (hover) color = new Vec4(0, 1, 0, 1);

        //Background rectangle
        AddBlock(new iVec2(0), this.Size, color);

        //Foreground text
        AddBlock(Text, new iVec2(0), this.Size, new Vec4(1), TextAlignment.TEXT_CENTER | TextAlignment.TEXT_MIDDLE);
    }
}

//Create function
public static Widget CreateCustomWidget(WString text, int x, int y, int width, int height, Widget parent, CustomWidgetStyle style)
{
    var widget = new CustomWidget();
    widget.Initialize(text, x, y, width, height, parent, (int)style);
    return widget;
}

public static void Main(string[] args)
{
    //Get the displays
    var displays = Display.GetDisplays();

    //Create a window
    var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    var ui = Interface.Create(window);

    //Create widget
    var widget = CreateCustomWidget("Custom", 20, 20, 120, 36, ui.Root, CustomWidgetStyle.CUSTOMWIDGET_DEFAULT);

    while (true)
    {
        var ev = WaitEvent();
        switch (ev.id)
        {
            case EVENT_WIDGETACTION:
                Print("Widget action: " + ev.data.ToString());
                break;
            case EVENT_WINDOWCLOSE:
                return;
        }
    }
}
```