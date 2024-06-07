# AsyncDownloadFile

This function provides a non-blocking method of downloading files for GUI applications.

## Syntax

- ASyncDownloadFileInfo **AsyncDownloadFile**([string](https://www.lua.org/manual/5.4/manual.html#6.4) url, [string](https://www.lua.org/manual/5.4/manual.html#6.4) localpath)

| Parameter | Description |
|---|---|
| url | remote path to download from |
| localpath | location of the downloaded file |

## Returns

Returns a ASyncDownloadFileInfo object with the following methods available:

- **GetProgress**: This will return the number of bytes read.
- **GetStatus**: This will return DOWNLOAD_FINISHED, DOWNLOAD_FAILED, or DOWNLOAD_INPROGRESS.
- **Cancel**: This will cancel the download if it is still in progress.
