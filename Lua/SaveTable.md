### Documentation

#### `shared_ptr`

`shared_ptr` is a smart pointer that manages the lifetime of an object by keeping track of the number of references to it. It allows multiple pointers to refer to the same object and automatically releases the object when no more references to it exist.

**Constructor**

- `shared_ptr()` Creates an empty `shared_ptr`.
- `shared_ptr<T>(T* ptr)` Creates a `shared_ptr` that points to the object `ptr`.

**Member Functions**

- `operator*` Returns a reference to the object pointed to by the `shared_ptr`.
- `operator->` Returns a pointer to the object pointed to by the `shared_ptr`.
- `use_count` Returns the number of `shared_ptr` objects referring to the same managed object.
- `reset` Resets the `shared_ptr` to point to a new object or null.

#### Example

```lua
-- Creating an empty shared_ptr
local ptr = shared_ptr()

-- Creating a shared_ptr that points to an object
local obj = MyClass()
local ptr = shared_ptr(obj) -- obj is now managed by the shared_ptr

-- Accessing the object pointed to by the shared_ptr
local ref = ptr:__deref() -- Get a reference to the object

-- Accessing members of the object
ref:myMethod() -- Call a method on the object

-- Checking the number of shared_ptr objects referring to the same object
local count = ptr:use_count()

-- Resetting the shared_ptr to point to a new object or null
ptr:reset() -- The object previously managed by ptr is released
```