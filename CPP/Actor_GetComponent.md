# Actor::GetComponent

This method gets the specified component, if it exists.

## Syntax

- shared_ptr<[Component](Component.md)\> **GetComponent**<T\>()
  
| Parameter | Description |
|----|----|
| T | type to get, must be the name of a class derived from the Component class |

## Returns

Returns the actor's component if it exists, otherwise NULL is returned.

