# WString

Base class: [Object](Object.md), string

This class provides an interface for manipulating wide unicode text strings. This class is preferable because it can support all characters.

| Property | Type | Description |
|---|---|---|
| WString | Constructor | WString(string c) |
| WString | Constructor | WString(char c) |
| WString | Constructor | WString(int i) |
| WString | Constructor | WString(float f) |
| WString | Constructor | WString(double f) |
| [Find](WString_Find.md) | Method | performs a search operation |
| [GetSize](WString_GetSize.md) | Method | returns the length of the string |
| [Left](WString_Left.md) | Method | returns leftmost characters |
| [Lower](WString_Lower.md) | Method | converts the string to lowercase |
| [Mid](WString_Mid.md) | Method | returns the length of the string |
| [Replace](WString_Replace.md) | Method | performs a search and replace operation |
| [Right](WString_Right.md) | Method | returns rightmost characters |
| [Split](WString_Split.md) | Method | segments the string |
| [StartsWith](WString_StartsWith.md) | Method | compares the beginning of two strings |
| [ToFloat](WString_ToFloat.md) | Method | converts the string to a floating point value |
| [ToInt](WString_ToInt.md) | Method | converts the string to an integer value |
| [ToString](WString_ToString.md) | Method | returns a narrow string containing only ASCII characters |
| [ToUtf8String](WString_ToUtf8String.md) | Method | returns a narrow string with UTF-8 encoding |
| [Trim](WString_Trim.md) | Method | removes whitespace characters from the ends of the string |
| [Upper](WString_Upper.md) | Method | converts the string to uppercase |
| [Xor](WString_Xor.md) | Method | performs an XOR operation |

**C# Syntax:**

```csharp
public class WString : Object
{
    public WString(string c);
    public WString(char c);
    public WString(int i);
    public WString(float f);
    public WString(double f);

    public int Find(string searchStr);
    public int GetSize();
    public string Left(int count);
    public string Lower();
    public string Mid(int pos, int count);
    public void Replace(string searchStr, string replaceStr);
    public string Right(int count);
    public string[] Split(string delimiter);
    public bool StartsWith(string prefix);
    public float ToFloat();
    public int ToInt();
    public string ToString();
    public string ToUtf8String();
    public string Trim();
    public string Upper();
    public string Xor(string other);
}
```
