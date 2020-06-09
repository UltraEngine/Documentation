# CreateFileSystemWatcher #
This function can be used to create an object that monitors a specified directory for changes.

## Syntax ##
- shared_ptr<[FileSystemWatcher](CPP_FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const string& path);
- shared_ptr<[FileSystemWatcher](CPP_FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const wstring& path);

### Parameters ###
|Name|Description|
|---|---|
|**path**|path to folder to watch|

## Returns ##
Returns a new FileSystemWatcher object if the specified directory exists, otherwise NULL is returned.

## Example ##
```c++

```
