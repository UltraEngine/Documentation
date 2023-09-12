## C++ Documentation

### `class MyObject`

This class represents a custom object. It has the following member functions:

- `void doSomething()`: This function does something.
- `void doSomethingWithInt(int value)`: This function does something with an integer value.

### Example

```cpp
#include <memory>

class MyObject {
public:
    void doSomething();
    void doSomethingWithInt(int value);
};

int main() {
    std::shared_ptr<MyObject> obj = std::make_shared<MyObject>();
    obj->doSomething();
    obj->doSomethingWithInt(42);
    
    return 0;
}
```

## Lua Documentation

### `MyObject` Class

This class represents a custom object. It has the following member functions:

- `MyObject:doSomething()`: This function does something.
- `MyObject:doSomethingWithInt(value)`: This function does something with an integer value.
  
### Example

```lua
MyObject = {}

-- Constructor
function MyObject:new()
    local newObj = {}
    setmetatable(newObj, self)
    self.__index = self
    
    return newObj
end

function MyObject:doSomething()
    -- Implementation details
end

function MyObject:doSomethingWithInt(value)
    -- Implementation details
end

-- Usage example
local obj = MyObject:new()
obj:doSomething()
obj:doSomethingWithInt(42)

```