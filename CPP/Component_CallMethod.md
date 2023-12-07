# Component::CallMethod

This method is used in C++ to call a method by name. User-defined components should use this to implement methods that can be triggered by a flowgraph connection.

## Syntax

- std::any **CallMethod**(shared_ptr<[Component](Component.md)\> caller, const [WString](WString.md)& name, const std::vector\<std::any\>& args)

| Parameter | Description |
|---|---|
| caller | the component that triggered this method |
| name | the name of the method |
| args | list of function parameters |

## Returns

Returns any value.

## Example

Here is an example of a component method that can be called by a flowgraph connection. The component code should check to make sure the supplied arguments are of the correct type.

```c++
virtual void SetHealth(const int healthvalue)
{
    this->health = healthvalue;
}

virtual std::any CallMethod(shared_ptr<Component> caller, const WString& name, const std::vector<std::any>& args)
{
    if (name == "SetHealth")
    {
        if (args.size() >= 1 and std::string(args[0].type().name()) == "int")
        {
            int arg0 = std::any_cast<int>(args[0]);
            SetHealth(arg0);
        }
    }
    return false;
}
```
