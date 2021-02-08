# Object::Self
This is the equivalent to calling the C++ **this** keyword inside a class method, except it will return a safe shared pointer.

### Syntax
- shared_ptr<[Object](Object.md)\> **Self**()

### Return Value
Returns a shared pointer to this object.

### Remarks
This method should *always* be used in place of the C++ keyword "this" for all objects created as a shared pointer.

This method should *never* be called in a class constructor or destructor.

You can cast to a derived type using the [Object::As](Object_As.md) mthoed.
