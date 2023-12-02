# Component::CallMethod

This method is used in C++ to call a method by name. User-defined components should use this to implement methods that can be triggered by a flowgraph connection.

## Syntax

- std::any **CallMethod**(shared_ptr<[Component](Component.md)> caller, const [WString](WString.md)& name, const std::vector<std::any>& args)

| Parameter | Description |
|---|---|
| caller | the component that triggered this method |
| name | the name of the method |
| args | list of function parameters |

## Returns

Returns any value.
