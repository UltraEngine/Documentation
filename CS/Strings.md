# Strings

Strings in Ultra Engine are handled with two classes. The [String](String.md) class defines a narrow string and is derived from both the std::string and [Object](Object.md) classes. The [WString](WString.md) class defines a wide string and is derived from both the std::wstring and [Object](Object.md) classes. It is preferable to use the [WString](WString.md) class, as this will handle all characters of all languages.

## Constructors

Both string classes can be created from a string literal:
```csharp
string s = "Hello!";
WString ws = "Hello!";
```
A wide string literal should be used for unicode strings:
```csharp
WString ws = L"您好";
```

Common numeric data types can be converted to a string with a constructor:
```csharp
string s1 = new string(2);// integer to string conversion
string s2 = new string(2.43434f);// float to string conversion
WString s3 = new WString(2343432.343243);// double float to wide string conversion
```

## String Conversion

Narrow to wide string conversion is automatic:

```csharp
string s = "Hello!";
WString ws = s;
```

Because wide to narrow string conversion can involve a possible loss of data, the [WString.ToString](WString_ToString.md) method must be explicitly called:

```csharp
WString ws = "Hello!";
string s = ws.ToString();
```

Strings can also be converted to integer or floating point values:
```csharp
int n = Int.Parse("465");
float f = float.Parse("3.14");
```