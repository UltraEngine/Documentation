# RunScript #
This function executes a Lua script from a file or string.

## Syntax ##
- bool RunScript(const std::string& source)
- bool RunScript(const std::wstring& path)

| Parameter | Description |
|-----|-----|
| source | file path or script source code to run |
| path | file path to run |

## Returns ##
Returns true if the script was successfully run, otherwise false is returned.

