# Object::As

This method casts the object to a derived type.

## Syntax

- shared_ptr<T\> **As**<T\>()

| Parameter | Description |
|---|---|
| T | type to cast to |

## Returns

Returns the object as a derived type **T**, or NULL if the object cannot be cast to the specified type.

## Remarks

This method should *never* be called in a class constructor or destructor.

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Cast to base type
	shared_ptr<Object> o = CreateBuffer();

	//Cast to derived type
	shared_ptr<Buffer> buffer = o->As<Buffer>();

	return 0;
}
```
