# Input
This function waits for a line of text to be input into the program console.

### Syntax
- **Input**(message: string): string

| Parameter | Description |
| ----- | ----- |
| message | message to print before the input is received. |

### Returns
When the user enters some text and presses enter, the typed input is returned.

### Remarks
On Windows, the project must be built as a console app. In **Configuration Properties > Linker > System** set **SubSystem** to **Console**.

### Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Input.png)

```lua
local s = Input("Enter your name:")
Print("You entered \"" .. s .. "\".")
```