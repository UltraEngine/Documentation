# GetPluginInfo #

## Syntax ##
- int GetPluginInfo(unsigned char* info, const int length)

### Parameters ###
| Name | Description |
|-|-|
| info | pointer to string where description will be stored in JSON format |
| size | max size the info buffer can accomodate |

## Returns ##
Returns the length of the plugin description in bytes.
