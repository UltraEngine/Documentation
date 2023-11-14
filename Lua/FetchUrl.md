# FetchUrl

This function returns the contents of a web page or the response of a web API endpoint.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **FetchUrl**([string](https://www.lua.org/manual/5.4/manual.html#6.4) url)

| Parameter | Description |
|------|-----------------|
| url  | The URL to fetch |

## Returns

Returns the contents of the specified URL as a string.

## Remarks

No caching will be used, so this function is appropriate for use with Web APIs.
