# DeleteFile #
This function deletes a file in the file system.

## Syntax ##
- bool **DeleteFile**(const [WString](WString)& path)

| Parameter | Description |
| --- | --- |
| path | location of file to delete |

# Returns #
Returns true if the file was successfully deleted.

# Remarks #
It is not possible to restore deleted files. Use this feature with caution.
