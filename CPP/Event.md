# Event #

This class contains information for events emitted by the GUI and other systems.

| Property | Type | Description |
|-----|-----|-----|
| data | int | Extra field for data |
| extra | shared_ptr<[Object](Object.md)\> | extra value associated witht the event |
| id | EventID | Event type |
| position | [iVec2](iVec2.md) | screen coordinate at which event occurred |
| size | [iVec2](iVec2.md) | size of the event source when the event occurred |
| source | shared_ptr<[Object](Object.md)\> | object that emitted the event |
| Event | Constructor | Event(const EventID id, shared_ptr<[Object](Object.md)\> source, const int data=0, [iVec2](iVec2.md) position = 0, [iVec2](iVec2.md) size = 0, shared_ptr<[Object](Object.md)\> extra = NULL) |
| [EmitEvent](EmitEvent.md) | Function | adds an event to the event queue |
| [PeekEvent](PeekEvent.md) | Function | checkd for the ID of the next event on the queue |
| [ListenEvent](ListenEvent.md) | Function | sets a callback function to execute when an event occurs |
| [WaitEvent](WaitEvent.md) | Function | wait until an event occurs and return it |