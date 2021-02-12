# Asset::Save #
This method saves the object to a file.

## Syntax ##
- bool **Save**(const [WString](WString.md)& path, const SaveFlags flags = SAVE_DEFAULT)

### Parameters ###
|Name|Description|
|-|-|
|path| file path to save to |
|flags| optional save flags |

## Returns ##
Returns true if saving is supported for this object type, and if the object was successfully saved, otherwise false is returned.