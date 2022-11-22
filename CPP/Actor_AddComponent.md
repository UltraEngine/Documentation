# Actor::AddComponent

This method adds a new component to the actor.

## Syntax

- shared_ptr<[Component](Component.md)\> **AddComponent**<T\>()
  
| Parameter | Description |
|----|----|
| T | type to add, must be the name of a class derived from the Component class |

## Returns

Returns a new component. If the component has already been added, then the existing one is returned.
