# Object::Self
This is the equivalent to calling C++ this inside a class method, except it will return a safe shared pointer.

### Syntax

- shared_ptr\<[Object](README.md)\> Self()

### Return Value

Returns a shared pointer to the object.

### Remarks

You can cast to a derived type like so:
```c++
MyClass::MyMethod()
{
  auto me = dynamic_pointer_cast<MyClass>(Self());
}
```
This method should **always** be used in place of the C++ keyword *this* for all objects created as a shared pointer.

This method should **never** be called in a class constructor or destructor.
