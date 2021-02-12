# LoadInterface #
This function loads a user interface from a JSON file.

## Syntax ##
shared_ptr<[Interface](Interface.md)\> LoadInterface(const [WString](WString.md) path, const LoadFlags flags = LOAD_DeFAUlt)

### Parameters ###
| Name | Description |
|---|---|
| path | file path to load |
| flags | optional load flags |

## Returns ##
Returns a new interface if it was successfully loaded, otherwise NULL is returned.