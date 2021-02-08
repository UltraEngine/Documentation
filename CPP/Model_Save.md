# Model::Save #
This method saves the model to a file.

## Syntax ##
- bool **Save**(const string& filename, const SaveFlags = SAVE_DEFAULT)
- bool **Save**(const wstring& filename, const SaveFlags = SAVE_DEFAULT)

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
  //Load plugin for model saving
  auto plugin = LoadPlugin("Plugins/OBJ.*");
  
  //Create model
  auto model = CreateBox(NULL);
  
  //Save to file
  if (model->Save("box.obj"))
  {
    //Show file
    OpenDir("box.obj")
  }
}
```
