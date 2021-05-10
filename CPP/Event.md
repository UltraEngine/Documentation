# Event #

This class contains information for events emitted by the GUI and other systems.

| Property | Type | Description |
|-----|-----|-----|
| data | int | field for event data value |
| extra | shared_ptr<[Object](Object.md)\> | extra value associated witht the event |
| id | EventID | Event type |
| position | [iVec2](iVec2.md) | screen coordinate at which event occurred |
| size | [iVec2](iVec2.md) | size of the event source when the event occurred |
| source | shared_ptr<[Object](Object.md)\> | object that emitted the event |
| Event | Constructor | Event(const EventID id, shared_ptr<[Object](Object.md)\> source, const int data=0, [iVec2](iVec2.md) position = 0, [iVec2](iVec2.md) size = 0, shared_ptr<[Object](Object.md)\> extra = NULL) |
| [AllocEventID](AllocEventID.md) | Function | allocates a unique event ID |
| [EmitEvent](EmitEvent.md) | Function | adds an event to the event queue |
| [PeekEvent](PeekEvent.md) | Function | returns true if any events are available in the event queue. |
| [ListenEvent](ListenEvent.md) | Function | sets a callback function to execute when an event occurs |
| [WaitEvent](WaitEvent.md) | Function | wait until an event occurs and return it |

The following event IDs may be emitted by the program:
| ID | Description |
|---|---|
| EVENT_WINDOWCLOSE |  |
| EVENT_WINDOWPAINT |  |
| EVENT_WINDOWSIZE |  |
| EVENT_MOUSEMOVE |  | |
| EVENT_MOUSEUP |  |
 || EVENT_MOUSEDOWN |  |
|  |EVENT_KEYUP |  |
| EV |ENT_KEYDOWN |  |
| EVEN |T_WINDOWMOVE |  |
| EVENT_MOUSEWHEEL |  |
| EVENT_KEYCHAR |  |
| EVENT_TIMERTICK |  |
| EVENT_DOUBLECLICK |  |
| EVENT_TRIPLECLICK |  |
| EVENT_MOUSELEAVE |  |
| EVENT_MOUSEENTER |  |
| EVENT_WIDGETSELECT |  |
| EVENT_WIDGETOPEN | |  |
| EVENT_WIDGETCLOSE  |  |
| EVENT_WIDGETACTION |  | 
| EVENT_WIDGETCT |  |
| E |VENT_WIDGETMENU |  | 
| EVE |NT_WINDOWSELECT |  |
| EVE  N_WINDOWDESELECT |  |
| EVEN T_KEYREPEAT |  |
| EVENT_M |OUSEREPEAT |  |
| EVENT_WIND  |OWDRAGBEGIN |  |
| EVENT_WINDOWD |RAGEND |  |
| EVENT_WIDGETGAI |NFOCUS |  |
| EVENT_WIDGETLOSEF |OCUS |  |
| EVENT_CURSORBLINK |  | |
| EVENT_WIDGETDROP |  | |
| EVENT_WINDOWDPICHANGE | |D |  | | | | |
