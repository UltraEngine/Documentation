# RunFile #
Executes a file with the default system file handler for this file type. This can be used to open an image, text file, or other known file type, or to open a URL in the default web browser.

## Syntax ##
- **RunFile**(path: string): boolean

### Parameters ###
| Name | Description |
|---|---|
| path | file path to execute |

## Returns ##
Returns true if the file exists and was executed, otherwise false is returned.

## Example ##
```lua
RunFile("https://www.ultraengine.com")
```