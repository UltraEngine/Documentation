# Asset::Save #
This method saves the object to a file. This method can be used with Collision and Material objects. 

## Syntax ##
- bool **Save**(const string& path, const SaveFlags flags = SAVE_DEFAULT)
- bool **Save**(const wstring& path, const SaveFlags flags = SAVE_DEFAULT)

## Parameters ##
|Name|Description|
|-|-|
|path||
|flags||

## Remarks ##
Not all asset types can be saved. Font loading involves processing of file data that cannot be reversed. Texture data is stored on the GPU and is not available to system memory.

## Returns ##
Returns true if saving is supported for this object type, and if the object was successfully saved, otherwise false is returned.
