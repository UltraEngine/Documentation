# Custom Widgets

You can create new types of widgets in C++ by extending the base [Widget](Widget.md) class.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

enum CustomWidgetStyle
{
    CUSTOMWIDGET_DEFAULT = 0
};

class CustomWidget : public Widget
{
    bool hover;
protected:
    virtual void MouseMove(const int x, const int y) {}
    
    virtual void MouseEnter(const int x, const int y)
    {
        hover = true;
        Redraw();
    }
    
    virtual void MouseLeave(const int x, const int y)
    {
        hover = false;
        Redraw();
    }

    virtual void MouseDown(const MouseButton button, const int x, const int y) {}
    virtual void MouseRepeat(const MouseButton button, const int x, const int y) {}
    virtual void MouseUp(const MouseButton button, const int x, const int y) {}
    virtual void LoseFocus() {}
    virtual void DoubleClick(const MouseButton button, const int x, const int y) {}
    virtual void TripleClick(const MouseButton button, const int x, const int y) {}
    virtual void GainFocus() {}
    virtual void KeyDown(const KeyCode key) {}
    virtual void KeyUp(const KeyCode key) {}
    virtual void KeyChar(const int keychar) {}
    virtual void MouseWheel(const int delta, const int x, const int y) {}
    virtual void Activate() {}

    virtual void Draw(const int x, const int y, const int width, const int height)
    {
        blocks.clear();
        Vec4 color = Vec4(1, 0, 0, 1);
        if (hover) color = Vec4(0, 1, 0, 1);

        //Background rectangle
        AddBlock(iVec2(0), this->size, color);

        //Foreground text
        AddBlock(text, iVec2(0), this->size, Vec4(1), TEXT_CENTER | TEXT_MIDDLE);
    }
public:
    CustomWidget() : hover(false)
    {}
};

shared_ptr<Widget> CreateCustomWidget(const WString& text, const int x, const int y, const int width, const int height, shared_ptr<Widget> parent, const CustomWidgetStyle style)
{
    auto widget = make_shared<CustomWidget>();
    widget->Initialize(text, x, y, width, height, parent, style);
    return widget;
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto widget = CreateCustomWidget("Custom",20,20,120,36,ui->root, CUSTOMWIDGET_DEFAULT);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            Print("Widget action: " + String(ev.data));
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
