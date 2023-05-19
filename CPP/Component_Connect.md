# Component::Connect

This method creates a logical connection between two components. This can be used to link entity actions together to create sequences of events.

## Syntax

- void **Connect**(const [WString](WString.md)& output, shared_ptr<[Component](Component.md)\> target, const [WString](WString.md)& input, const std::vector\<std::any\>& arguments = {} )
- void **Connect**(const [WString](WString.md)& output, shared_ptr<[Component](Component.md)\> target, [sol::function](https://sol2.readthedocs.io/en/latest/api/function.html) input, const std::vector\<[sol::object](https://sol2.readthedocs.io/en/latest/api/object.html)\>& arguments = {} )

| Parameter | Description |
|---|---|
| output | name of the output method this connection is triggered by |
| traget | the destination component to target, on any entity |
| input | the destination method to call |
| arguments | optional arguments to pass to the input method | 
