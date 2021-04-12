# Add to an Existing Project

If you have an existing project and you want to add the Ultra App Kit library to provide a front-end interface, you can accomplish this with the steps below.

### Header Search Paths

You must add a header search path in your project settings, for both release and debug configurations:
```txt
C:/Program Files/Ultra App Kit/Include
```

If you are using Ultra App Kit on Steam the default location will be here:
```txt
C:/Program Files (x86)/Steam/steamapps/common/Ultra App Kit/Include
```

### Include Header and Library

Add this code in your main project header to include the Ultra App Kit library. You may need to edit the location of the header and library files to match your machine's configuration:

```c++
//Include header file
#define _ULTRA_APPKIT
#include "C:\\Program Files\\Ultra App Kit\\Include\\UltraEngine.h"

//Compile library into project
#ifdef _WIN32
  #ifdef _WIN64
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win64\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win64\\App Kit.lib")
    #endif
  #else
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win32\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Lib\\win32\\App Kit.lib")
    #endif  
  #endif  
#endif
```

If you are using Ultra App Kit on Steam here is the code for the default install location:

```c++
//Include header file
#define _ULTRA_APPKIT
#include "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Include\\UltraEngine.h"

//Compile library into project
#ifdef _WIN32
  #ifdef _WIN64
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win64\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win64\\App Kit.lib")
    #endif
  #else
    #ifdef _DEBUG
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win32\\App Kit_d.lib")
    #else
      #pragma comment (lib, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Ultra App Kit\\Lib\\win32\\App Kit.lib")
    #endif
  #endif  
#endif
```
