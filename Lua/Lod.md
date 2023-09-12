### Lod

This class stores mesh data for one level of detail in a [Model](Model.md).

#### Properties

* `meshes`: `table`, an array of meshes in this level of detail.

#### Property Details

##### meshes

**Type**: `table`

An array of meshes in this level of detail.

**Example**

```lua
lod = {
  meshes = {
    [1] = shared_ptr_Mesh,
    [2] = shared_ptr_Mesh,
    -- ...
  }
}
```