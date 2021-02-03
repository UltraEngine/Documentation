# Strings #
Strings in Ultra Engine are handled with two classes. The [String](String.md) class defines a narrow string and is derived from both the std::string and [Object](Object.md) classes. The [WString](WString.md) class defines a wide string and is derived from both the std::wstring and [Object](Object.md) classes. It is preferable to use the [WString](WString.md) class, as this will handle all characters of all languages.

## Constructors ##
Common data types can be converted to a string with a constructor:
```c++
String s1 = String(2);// integer to string conversion
String s2 = String(2.43434f);// float to string conversion
WString s3 = WString(2343432.343243);// double float to wide string conversion
```

## String Conversion ##
Narrow to wide string conversion is automatic:
```c++
String s = "Hello!";
WString ws = s;
```

Because wide to narrow string conversion can involve a possible loss of data, the [WString::ToString](WString_ToString.md) method must be explicitly called:
```c++
WString ws = "Hello!";
String s = ws.ToString();
```
