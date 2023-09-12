# LoadTable

This function loads a Lua table from a JSON file or open stream.

## Syntax

```
table LoadTable(path: string): table
table LoadTable(stream: userdata<WString>): table
```

### Parameters

| Parameter | Description |
|---|---|
| path | A string representing the file path to load. |
| stream | A userdata representing the stream to read from. |

## Returns

This function always returns a table, but the returned table may be `nil` if it was not loaded successfully.