# DownloadFile

This function downloads a file from a web server and saves it to the user's hard drive.

## Syntax 
- boolean **DownloadFile**([string](https://www.lua.org/manual/5.4/manual.html#6.4) src, [string](https://www.lua.org/manual/5.4/manual.html#6.4) dest)

| Parameter | Description |
|---|---|
| src | URL of the file to download | 
| dest | local file path to save to |

## Returns

Returns true if the download succeeds, otherwise false is returned.

## Remarks

Downloaded files are stored in a local cache. You do not need to implement an additional caching system.

## Example

```lua
src = "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/ultraengine_logo.png"
dst = GetPath(PATH_DOCUMENTS) .. "/temp.png"

print("Downloading...")
if DownloadFile(src,dst) then
	print("Download complete.")
	RunFile(dst)
else
	print("Failed to download file.")
end
```
