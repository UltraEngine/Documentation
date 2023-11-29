# Model.Save

This method saves the model to a file, in [glTF](https://www.khronos.org/gltf/) or Wavefront OBJ format.

## Syntax

- bool **Save**(string **path**, SaveFlags **flags** = SAVE_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to save |
| flags | optional save flags |

## Returns

Returns true if the model is successfully saved, otherwise false is returned.

## Example

```C#
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Create model
        Model model = CreateBox(null);

        //Save to file
        if (model.Save("box.obj"))
        {
            //Show file
            OpenDir("box.obj");
        }
    }
}
```