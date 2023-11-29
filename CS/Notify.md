# Notify #
This functions displays a message box.

## Syntax ##
- void **Notify**(string message, string title = "", bool serious = false)

| Parameter | Description |
| ----- | ----- |
| message | message to display in the message box |
| title | optional title of message box window | 
| serious | If set to true a warning icon will be displayed |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Notify.png)

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Notify("Hello, world!");
        return;
    }
}
```