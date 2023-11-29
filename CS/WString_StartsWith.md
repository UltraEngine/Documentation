# WString.StartWith

This method compares the beginning of two strings.

## Syntax

```csharp
public bool StartsWith(WString beginning)
```

| Parameter | Description |
|---|---|
| beginning | string to compare |

## Returns

If the left-most characters of this string match the beginning string then true is returned.

If the strings do not match, or if this string is shorter than the beginning string, then false is returned.

### Example

```csharp
string str1 = "Hello World";
string str2 = "Hello";

bool result = str1.StartsWith(str2);
// result will be true
```