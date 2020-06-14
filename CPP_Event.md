# Event #

This class contains information for events emitted by the GUI and other systems.

| Property | Type | Description |
|-----|-----|-----|
| data | int | Extra field for data |
| id | [EventID]() | Event type |
| extra | [Object](API_Object.md) | Extra field for additional information. |
| position | [iVec2](API_iVec2.md) | Screen coordinate at which event occurred. |
| size | [iVec2](API_iVec2.md) | Size of the event source when the event occurred. |
| source | [Object](API_Object.md) | Object that emitted the event. |
| [EmitEvent](API_EmitEvent.md) | Function | Add an event to the event queue. |
| [PeekEvent](API_PeekEvent.md) | Function | Check for the ID of the next event on the queue. |
| [WaitEvent](API_WaitEvent.md) | Function | Wait until an event occurs and return it. |
