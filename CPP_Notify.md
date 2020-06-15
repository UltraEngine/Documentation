# Notify #
This functions displays a message box.

## Syntax ##
- void **Notify**(const string& message, const string& title = "")
- void **Notify**(const wstring& message, const wstring& title = L"")

| Parameter | Description |
| ----- | ----- |
| message | |
| title | | 

```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{ 
  Notify("Hello, world!");
  return 0;
}
```
