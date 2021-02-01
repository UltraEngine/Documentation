# Object::Self #
This method can be used safely within a derived object class method to return a valid shared pointer to the object.

## Syntax ##
- shared_ptr<[Object](Object)\> **Self**()

## Returns ##
Returns a shared pointer to the object. To cast the object to a different type use the [As](Object_As.md)() method.

## Remarks ##
This method should never be called in the object's constructor or destructor. Doing so will create an invalid shared pointer.
