# Notify #

This function displays a message box.

```lua
function Notify(message, title, serious)
```

Displays a message box with the specified `message`. 

### Parameters ###

| Parameter | Description |
| ----- | ----- |
| message | message to display in the message box |
| title | optional title of the message box window | 
| serious | If set to true a warning icon will be displayed |

### Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Notify.png)

```lua
Notify("Hello, world!")
```