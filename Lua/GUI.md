# GUI

The Lua bindings for Ultra Engine provide a robust graphical user interface for creating in-game interfaces and desktop applications.

## Creating a GUI

The first step to creating a GUI is to retrieve the machine's displays (monitors). A window is then created on one display, typically the primary one, which is listed first. An [Interface](Interface.md) object is created on the window, which contains all our user interface elements. One or more [Widgets](Widget.md) are created on the root interface panel. Some widgets may have multiple items added to them with the `Widget:AddItem()` method.

```lua
-- Retrieve displays
local displays = GetDisplays()

-- Create a window on the primary display
local window = Window(displays[1])

-- Create an interface on the window
local interface = Interface(window)

-- Create widgets on the root interface panel
local widget1 = Widget(interface)
local widget2 = Widget(interface)

-- Add items to the widgets
widget1:AddItem(item1)
widget1:AddItem(item2)
widget2:AddItem(item3)
```

## Event Handling

Widgets and timers are the two object types that may emit events using the `EmitEvent()` command. When this is called, the event is first evaluated by any callbacks that have been defined with the `ListenEvent()` function. The event is then added to the event queue, where it may be retrieved using the `WaitEvent()` command.

```lua
-- Define a callback for a specific event
local function myCallback(event)
    if event.type == EventType.ButtonClicked then
        -- Do something when a button is clicked
    elseif event.type == EventType.InputTextChanged then
        -- Do something when input text is changed
    end
end

-- Register the callback for the event
ListenEvent(EventType.ButtonClicked, myCallback)

-- Emit an event
EmitEvent(EventType.ButtonClicked, eventData)

-- Wait for the event to be retrieved from the event queue
local event = WaitEvent()
```