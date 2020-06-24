# Notify #
This functions displays a message box.

## Syntax ##
- void **Notify**(const string& message, const string& title = "", const bool serious = false)
- void **Notify**(const wstring& message, const wstring& title = L"", const bool serious = false)

| Parameter | Description |
| ----- | ----- |
| message | Message to display in the message box. |
| title | Optional title of message box window. | 
| serious | If set to true a warning icon will be displayed. |

```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{ 
  Notify("Hello, world!");
  return 0;
}
```
