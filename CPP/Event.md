# Event #

This class contains information for events emitted by the GUI and other systems.

| Property | Type | Description |
|-----|-----|-----|
| data | int | field for event data value |
| extra | shared_ptr<[Object](Object.md)\> | extra value associated witht the event |
| id | EventId | Event type |
| position | [iVec2](iVec2.md) | screen coordinate at which event occurred |
| size | [iVec2](iVec2.md) | size of the event source when the event occurred |
| source | shared_ptr<[Object](Object.md)\> | object that emitted the event |
| text | [WString](WString.md) | string information like file paths |
| Event | Constructor | Event(const EventID id, shared_ptr<[Object](Object.md)\> source, const int data=0, [iVec2](iVec2.md) position = 0, [iVec2](iVec2.md) size = 0, shared_ptr<[Object](Object.md)\> extra = NULL) |
| [EmitEvent](EmitEvent.md) | Function | adds an event to the event queue |
| [FlushEvents](FlushEvents.md) | Function | clears the event queue |
| [PeekEvent](PeekEvent.md) | Function | returns true if any events are available in the event queue. |
| [ListenEvent](ListenEvent.md) | Function | sets a callback function to execute when an event occurs |
| [WaitEvent](WaitEvent.md) | Function | wait until an event occurs and return it |

The following event IDs may be emitted by the program.

| ID | Description |
| --- | --- |
| EVENT_WINDOWCLOSE | window is closed |
| EVENT_WINDOWPAINT | window region is drawn |
| EVENT_WINDOWSIZE | window is resized |
| EVENT_MOUSEMOVE | mouse cursor moves |
| EVENT_MOUSEUP | mouse button released |
| EVENT_MOUSEDOWN | mouse button pressed |
| EVENT_KEYUP | key is released |
| EVENT_KEYDOWN | key is pressed |
| EVENT_WINDOWMOVE | window position changed |
| EVENT_MOUSEWHEEL | mouse wheel turned |
| EVENT_KEYCHAR | key is pressed. The ASCII character is stored in the data member |
| EVENT_TIMERTICK | timer tick occurs |
| EVENT_DOUBLECLICK | mouse button is double-clicked |
| EVENT_TRIPLECLICK | mouse button is triple-clicked |
| EVENT_MOUSELEAVE | mouse cursor leaves the window client area |
| EVENT_MOUSEENTER | mouse cursor enters the window client area |
| EVENT_STARTRENDERER | if data is 1 the graphics renderer has been initialized and the graphics device name is stored in the event text, otherwise it failed to initialize and an error message is stored in the Event text | 
| EVENT_WIDGETDESELECT | widget item is deselected |
| EVENT_WIDGETOPEN | treeview node is expanded |
| EVENT_WIDGETCLOSE | treeview node is collapsed |
| EVENT_WIDGETACTION | widget action occurs | 
| EVENT_WIDGETSELECT | widget item is selected |
| EVENT_WIDGETMENU | widget menu is activated | 
| EVENT_WINDOWSELECT | new window gains the focus |
| EVENT_WINDOWDESELECT | window loses the focus |
| EVENT_KEYREPEAT | key is held down for an amount of time |
| EVENT_WINDOWDRAGBEGIN | window move or resize loop begins |
| EVENT_WINDOWDRAGEND | window move or resize loop ends |
| EVENT_WIDGETGAINFOCUS | widget loses the focus |
| EVENT_WIDGETLOSEFOCUS | new widget is gains the focus |
| EVENT_WIDGETDROP | drag-and-drop operation occurs |
| EVENT_WINDOWDPICHANGE | the display of a window has changed its DPI scale |
| EVENT_ZOOM | for high-precision trackpad and mouse scroll events | 
