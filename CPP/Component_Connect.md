# Component::Connect

## Syntax

- void **Connect**(const [WString](WString.md)& output, shared_ptr<[Component](Component.md)\> target, const [WString](WString.md)& input, const std::vector\<std::any\>& arguments = {} )
- void **Connect**(const [WString](WString.md)& output, shared_ptr<[Component](Component.md)\> target, [sol::function](https://sol2.readthedocs.io/en/latest/api/function.html) method, const std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& arguments = {} )
- void **Connect**(const [WString](WString.md)& output, std::function<void()> func )
