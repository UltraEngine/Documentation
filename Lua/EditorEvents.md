# Editor Events

These are special events that only occur in the Ultra Engine editor.

| EventId | Description |
|---|---|
| EVENT_CLOSEASSETPREVIEW | Triggered when any action occurs that should cause a popup file preview to close. This can be triggered by mouse movement, window focus changing, and other events. |
| EVENT_OPENASSETPREVIEW | Triggered when the asset browser is to display a popup preview panel of a file the mouse is hovered over. The event position and area values indicate a rectangle used for positioning of the popup window. The event source will be the interface element that triggered the event, typically the editor asset browser. The event text value contains the path of the file. The event extra value contains a package object the file is loaded from, if applicable. |
| EVENT_OPENASSET | Triggered when a file is double-clicked in the asset browser. The event text field contains the file path and the extra field contains the package object, if applicable. |
| EVENT_PROGRAMSTART | Triggered once when the program starts. The event data value contains the startup time in milliseconds. |
