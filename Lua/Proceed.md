# Proceed #

This function displays a message dialog box with the options "Yes", "No", and "Cancel".

## Syntax ##
- **Proceed**(message: string, title: string, serious: boolean): number

### Parameters ###
| Name | Description |
| --- | --- |
| message | text for the message dialog box to display |
| title | title for the message dialog box to display |
| serious | if set to true the dialog box will display a warning icon |

## Returns ##
If the user pressed the Yes button 1 is returned. If the user presses the cancel button 0 is returned. If the user presses the No button -1 is returned.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Proceed.png)

```lua
Print(Proceed("Do you wish to continue?"))
```