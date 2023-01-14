# Console

The console displays printed program output and allows the user to enter commands.

| Property | Type | Description |
|---|---|---|
| panel | [Widget](Widget.md) | main interface element panel |
| entry | [Widget](Widget.md) | textfield for entering  user input |
| log | [Widget](Widget.md) | textarea for displaying program output |
| errorrlog | [Widget](Widget.md) | listbox for displaying program errors |
| warninglog | [Widget](Widget.md) | listbox for displaying program warnings |
| errorbutton | [Widget](Widget.md) | button for selecting error display |
| warningbutton | [Widget](Widget.md) | button for selecting warning display |
| logbutton | [Widget](Widget.md) | button for selecting log display |
| AddMessage | Method | adds a warning, error, or line of text to the console |
| Clear | Method | clears the console log, error list, or warnings list |

The console will emit the following events:

| Event ID | Description |
|---|---|
| EVENT_CONSOLELOG | emitted after a line of text is added to the console |
| EVENT_CONSOLEERROR | emitted after a new error is added to the console |
| EVENT_CONSOLEWARNING | emitted after a new warning is added to the console |

Here is an example of an extension that displays a notification box whenever an error is sent to the console:

```lua
function ConsoleErrorListener(event)
  Notify(program.mainwindow.text, event.text, true)
end

ListenEvent(EVENT_CONSOLEERROR, program.console, ConsoleErrorListener)
```
