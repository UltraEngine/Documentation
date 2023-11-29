```csharp
// AddBlock method

// Option 1
int AddBlock(iVec2 position, iVec2 size, Vec4 color = Vec4(0), bool wireframe = false, float radius = 0.0f, float gradient = 1.0f);

// Option 2
int AddBlock(WString text, iVec2 position, iVec2 size, Vec4 color, TextAlignment alignment = 0);

// Option 3
int AddBlock(shared_ptr<Icon> icon, iVec2 position, float scale = 1.0f, Vec4 color = 1.0f);

// Option 4
int AddBlock(shared_ptr<Pixmap> pixmap, iVec2 position, Vec4 color = 1.0f);
```

```csharp
// Example code
using UltraEngine;

enum CustomWidgetStyle
{
    CUSTOMWIDGET_DEFAULT = 0
}

class CustomWidget : Widget
{
    bool hover;

    protected override void MouseMove(int x, int y) { }

    protected override void MouseEnter(int x, int y)
    {
        hover = true;
        Redraw();
    }

    protected override void MouseLeave(int x, int y)
    {
        hover = false;
        Redraw();
    }

    protected override void MouseDown(MouseButton button, int x, int y)
    {
        if (button == MouseButton.MOUSE_LEFT) EmitEvent(EVENT_WIDGETACTION, Self());
    }

    protected override void MouseUp(MouseButton button, int x, int y) { }

    protected override void LoseFocus() { }

    protected override void DoubleClick(MouseButton button, int x, int y) { }

    protected override void TripleClick(MouseButton button, int x, int y) { }

    protected override void GainFocus() { }

    protected override void KeyDown(KeyCode key) { }

    protected override void KeyUp(KeyCode key) { }

    protected override void KeyChar(int keychar) { }

    protected override void MouseWheel(int delta, int x, int y) { }

    protected override void Draw(int x, int y, int width, int height)
    {
        blocks.Clear();
        Vec4 color = new Vec4(1, 0, 0, 1);
        if (hover) color = new Vec4(0, 1, 0, 1);

        //Background rectangle
        AddBlock(new iVec2(0), this.size, color);

        //Foreground text
        AddBlock(text, new iVec2(0), this.size, new Vec4(1), TextAlignment.TEXT_CENTER | TextAlignment.TEXT_MIDDLE);
    }
}

shared_ptr<Widget> CreateCustomWidget(WString text, int x, int y, int width, int height, shared_ptr<Widget> parent, CustomWidgetStyle style)
{
    var widget = make_shared<CustomWidget>();
    widget.Initialize(text, x, y, width, height, parent, style);
    return widget;
}

int main(int argc, char[] argv)
{
    var displays = GetDisplays();

    var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    var ui = CreateInterface(window);

    var widget = CreateCustomWidget("Custom", 20, 20, 120, 36, ui.root, CustomWidgetStyle.CUSTOMWIDGET_DEFAULT);

    while (true)
    {
        var ev = WaitEvent();
        switch (ev.id)
        {
            case EVENT_WIDGETACTION:
                Print("Widget action: " + ev.data.ToString());
                break;
            case EVENT_WINDOWCLOSE:
                return 0;
                break;
        }
    }
    return 0;
}
```