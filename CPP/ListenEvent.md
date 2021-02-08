# ListenEvent #

This function sets a callback function that will be executed when an event occurs.

## Syntax ##
- void **ListenEvent**(const EventID id, shared_ptr<[Widget](Widget.md)\> source, callback(const [Event](Event.md)& event, shared_ptr<[Object](Object.md)\> extra),  shared_ptr<[Object](Object.md)\> extra = NULL)

| Parameter | Description |
|---|---|
| id | event ID to listen for, or EVENT_ANY to listen for all events |
| source | event source to listen for, or NULL for events emitted from any source |
| extra | extra object to pass to the callback function |

# Remarks #

Internally, this function will store a weak pointer to the event source and a shared pointer to the extra field.
