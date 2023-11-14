# ASyncDownloadFile

This function provides a non-blocking method of downloading files for GUI applications.

## Syntax

- ASyncDownloadFileInfo **ASyncDownloadFile**(string url, string localpath)

| Parameter | Description |
|---|---|
| url | remote path to download from |
| localpath | location of the downloaded file |

## Returns

Returns a ASyncDownloadFileInfo object with the following methods available:

- **GetProgress**: This will return a float value between zero and one, indicating the download progress.
- **GetStatus**: This will return DOWNLOAD_FINISHED, DOWNLOAD_FAILED, or DOWNLOAD_INPROGRESS.
