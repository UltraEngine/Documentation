# EmitEvent #
This function adds an event to the event queue and triggers any callbacks added with the [ListenEvent](ListenEvent.md) function.

## Syntax ##
- void EmitEvent(const [Event](Event.md)& event)
- void EmitEvent(const EventID id, shared_ptr<[Object](Object.md)\> source, const int data = 0, const int x = 0, const int y = 0, const int width = 0, const int height = 0, shared_ptr<[Object](Object.md)\> extra = NULL)

### Parameters ###
| Name | Description |
| --- | --- |
| event | event to emit |
| id | event ID |
| source | event source |
| data | event data |
| x | X component of event position |
| y | Y component of event position |
| width | X compononent of event size | 
| height | Y component of event size |
| extra | event extra data |