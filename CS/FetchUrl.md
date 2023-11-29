# FetchUrl

This functions returns the contents of a web page or the response of a web API endpoint.

## Syntax

```csharp
string FetchUrl(string url);
```

| Parameter | Description |
|---|---|
| url | URL to fetch |

## Returns

Returns the contents of the specified URL as a string.

## Remarks

No caching will be used, so this function is appropriate for use with Web APIs.