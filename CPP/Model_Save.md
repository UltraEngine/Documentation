# Model::Save

This method saves the model to a file, in [glTF](https://www.khronos.org/gltf/) or Wavefront OBJ format.

## Syntax

- bool **Save**(const [WString](WString.md)& path, const SaveFlags = SAVE_DEFAULT)

| Parameter | Description |
|---|---|
|||

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
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
