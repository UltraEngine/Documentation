# Component

This class can be extended to add behavior and properties to an [Entity](Entity.md).

| Property | Type | Description |
|---|---|---|
| entity | [Entity](Entity.md)* | entity this component is attached to |
| [Collide](Component_Collide.md) | Method | called whenever a physics collision occurs |
| [Copy](Component_Copy.md) | Method | makes a copy of the component, for copying entities |
| [Load](Component_Load.md) | Method | called when an actor is loaded or copied |
| [Save](Component_Save.md) | Method | called when an actor is saved or copied |
| [Start](Component_Start.md) | Method | called when a component is added |
| [Update](Component_Update.md) | Method | called once for each actor in [World::Update](World_Update.md) |

You can override these methods or add your own in your component class. To add a new component, just create a new .hpp file in your "Source\Components" folder. You can use separate header and code files if you want, but it is more convenient to put everything in a single file that automatically gets included into your project. Compile your project once and the precompiler will detect your new file and update the component system code. The precompiler will automatically generate the files "ComponentSystem.h" and "ComponentSystem.cpp". These files should never be changed by hand, since they will be overwritten every time the precompiler runs.

The precompiler is limited in its ability to parse C++ declarations, so it's a good idea to stick to straightforward C++ syntax.

### Example Component

The Mover component is about as simple as it gets. It just stores some motion parameters and moves or turns the entity each time Update is called:
```c++
#pragma once
#include "UltraEngine.h"
#include "../ComponentSystem.h"

class Mover : public Component
{
public: 
     
    Vec3 movementspeed;
    Vec3 rotationspeed;
    bool globalcoords = false;
    
    virtual void Update()
    {
        if (globalcoords)
        {
            this->entity->Translate(movementspeed / 60.0f, true);
        }
        else
        {
            this->entity->Move(movementspeed / 60.0f);
        }
        this->entity->Turn(rotationspeed / 60.0f, globalcoords);
    }
}; 
```
### Calling Methods

When calling methods, you should call the actor method like this:
```c++
void HealthManager::TakeDamage(const int damage)
{
  health -= damage;
  if (health <= 0) actor->Kill();
}
```
Don't call the component's own method directly unless you are sure you want to:
```c++
void HealthManager::TakeDamage(const int damage)
{
  health -= damage;
  if (health <= 0) Kill();
}
```
When you call the actor method, all components with the called method will be executed, allowing for more emergent behavior between components. For example, another component might have a Kill() method that plays a sound when called. By calling the Actor method, we ensure that all variations of the method are executed, so that all components can enact their behaviors.
