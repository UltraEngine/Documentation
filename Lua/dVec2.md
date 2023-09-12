## Documentation: shared_ptr

### Description
A shared_ptr is a smart pointer that manages the lifetime of an object using reference counting. Multiple shared_ptr objects may own the same object.

### Syntax
```lua
shared_ptr<T> mySharedPtr

```

### Methods

#### shared_ptr<T> new()
Creates a new shared_ptr object.

#### shared_ptr<T> new(T* ptr)
Creates a new shared_ptr object and initializes it with a raw pointer.

#### elemType* get()
Returns a raw pointer to the stored object.

#### void reset()
Releases ownership of the stored object and destroys it if no other shared_ptr objects are owning it.

#### elemType* operator->()
Returns a raw pointer to the stored object.

#### elemType& operator*()
Returns a reference to the stored object.

#### long use_count()
Returns the number of shared_ptr objects owning the same object.

#### bool unique()
Checks if the shared_ptr object is the sole owner of the stored object.

### Example

```lua
local shared_ptr = {}

shared_ptr.new = function(cls)
    local self = {}
    self.elemType = nil
    self.ptr = nil
    self.count = 0

    self.new = function()
        local obj = cls()
        obj.elemType = "shared_ptr"
        obj.ptr = nil
        obj.count = 0
        return obj
    end

    self.newWithPtr = function(ptr)
        local obj = cls()
        obj.elemType = "shared_ptr"
        obj.ptr = ptr
        obj.count = 1
        return obj
    end

    self.get = function()
        return self.ptr
    end
    
    self.reset = function()
        self.ptr = nil
        self.count = 0
    end
    
    self.__index = self
    
    return self
end

-- Create a new shared_ptr object
local mySharedPtr = shared_ptr.new()

-- Create a new shared_ptr object and initialize it with a raw pointer
local myOtherSharedPtr = shared_ptr.newWithPtr("Hello, World!")

-- Access the stored object using the arrow operator
print(myOtherSharedPtr:get())

-- Release ownership of the stored object
myOtherSharedPtr:reset()

```