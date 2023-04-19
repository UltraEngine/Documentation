# LoadTable

This function loads a C++ table from a JSON file or open stream.

## Syntax

- [table](https://github.com/UltraEngine/tableplusplus#programming-guide) **LoadTable**(const [WString](WString.md)& path)
- [table](https://github.com/UltraEngine/tableplusplus#programming-guide) **LoadTable**(shared_ptr<[WString](WString.md)\> stream)

| Parameter | Description |
|---|---|
| path | file path to load |
| stream | stream to read from |

## Returns

This function always returns a table, but the returned table may be equal to nullptr if it was not loaded successfully.
