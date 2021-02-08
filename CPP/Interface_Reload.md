# Interface::Reload #
This method reloads the interface from a file or stream. The hierarchy in the saved file must match the interface hierarchy.

## Syntax ##
- bool **Reload**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)
- bool **Reload**(const shared_ptr<[Stream](Stream.md)>, const LoadFlags flags = LOAD_DEFAULT)

### Parameters ###
| Name | Description |
| --- | --- |
| path | file path to load |
| stream | stream to read from |
| flags | optional load flags |

## Returns ##
True is returned if the interface was successfully reloaded, otherwise false is returned.
