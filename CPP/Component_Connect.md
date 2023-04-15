# Component::Connect

## Syntax

- void **Connect**(const WString& output, shared_ptr<[Component](Component.md)\> target, const WString& input, const std::vector< std::any \>& arguments = {} )
- void **Connect**(const WString& output, shared_ptr<[Component](Component.md)\> target, sol::function method, const std::vector< sol::object \>& arguments = {} )
- void **Connect**(const WString& output, std::function<void()> func )
