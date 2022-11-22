# Component

This class can be extended to add behavior and properties to an [Actor](Actor.md).

| Property | Type | Description |
|---|---|---|
| entity | shared_ptr<[Entity](Entity.md)\> | entity this component's actor contains |
| [GetActor](Component_GetActor.md) | Method | retrieves the actor this component is attached to |
| [Collision](Component_Collision.md) | Method | called whenever a physics collision occurs |
| [LoadState](Component_LoadState.md) | Method | called when an actor is loaded or copied |
| [SaveState](Component_SaveState.md) | Method | called when an actor is saved or copied |
| [Update](Component_Update.md) | Method | called once for each actor in [World::Update](World_Update.md) |

You can override these methods or add your own in your component class. 

### Example Component

The Mover component is about as simple as it gets. It just stores some motion parameters and moves or turns the entity each time Update is called:
```c++
#pragma once
#include "UltraEngine.h"
#include "../ComponentSystem.h"

class Mover : public Component
{
public: 
     
    Vec3 movement;
    Vec3 rotation;
    bool globalcoords = false;
    
    virtual void Update()
    {
        if (globalcoords)
        {
            this->entity->Translate(movement / 60.0f, true);
        }
        else
        {
            this->entity->Move(movement / 60.0f);
        }
        this->entity->Turn(rotation / 60.0f, globalcoords);
    }
}; 
```
### Calling Methods

When calling methods within methods, you should call the actor method like this:
```c++
void HealthManager::TakeDamage(const int damage)
{
  health -= damage;
  if (health <= 0) GetActor()->Kill();
}
```
Don't call the component method directly:
```c++
void HealthManager::TakeDamage(const int damage)
{
  health -= damage;
  if (health <= 0) this->Kill();
}
```
When you call the actor method, all components with the called method will be executed, allowing for more emergent behavior between components.
