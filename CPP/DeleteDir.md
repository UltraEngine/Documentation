# DeleteDir #
This function deletes a folder in the file system.

## Syntax ##
- bool **DeleteDir**(const [WString](WString)& path, const bool recursive = false)

| Parameter | Description |
| --- | --- |
| path | folder location to delete |
| recursive | if set to true, all files and subfolders will be deleted |

# Returns #
Returns true if the folder was successfully deleted.

# Remarks #
If any files or subfolders exist within the specified folder, it will not be deleted unless the recursive option is set to true. **Use this option with caution.**
