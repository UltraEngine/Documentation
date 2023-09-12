# Object:Self

This function is the equivalent of the C++ **this** keyword inside a class method, except it returns a safe shared_ptr.

## Syntax

```lua
function Object:Self()
```

## Return Value

Returns a shared pointer to the current object.

## Remarks

This function should always be used inside a class method instead of the C++ keyword "this" for all objects created as a shared pointer.

This function should never be called in a class constructor or destructor.

To cast to a derived type, use the [Object:As](Object_As.md) method.

## Example
```lua
require("UltraEngine")

MyClass = Object:subclass("MyClass")
MyClass.text = ""

function MyClass:MyFunc(o)
    print(o:As(MyClass).text)
end

function MyClass:Update()
    -- Pass a shared pointer to this object to the function
    self:MyFunc(self:Self())
end

function main()
    local o = MyClass()
    o.text = "Hello!"
    o:Update()
end

main()
```