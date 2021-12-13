# AssetBrowser::SelectFolder

This method navigates to a folder in the asset browser. The folder must exist within the current project directory.

## Syntax

- boolean **SelectFolder**(string path, [Package](Package.md) package = nil)

| Parameter | Description |
|---|---|
| path | path to new folder |
| package | if specified, the path will be a subfolder within this package |

## Returns

Returns true of the folder was selected, otherwise false is returned.
