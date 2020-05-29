# Object::Self #
This method can be used safely within a derived object class method to return a valid shared pointer to the object.

## Syntax ##
- shared_ptr<[Object](API_Object)\> **Self**()

## Returns ##
Returns a shared pointer to the object.

## Remarks ##
This method should never be called in the object's constructor or destructor. Doing so will result in an invalid shared pointer.
