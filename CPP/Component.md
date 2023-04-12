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

## Example Component

The Mover component is about as simple as it gets. It just stores some motion parameters and moves or turns the entity each time Update is called:
```c++
#pragma once
#include "UltraEngine.h"

class Mover : public Component
{
public: 
     
    Vec3 movementspeed;
    Vec3 rotationspeed = Vec3(0, 10, 0);
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

## Component Methods and Members

To call a component method or get a value, first check if a component of the desired type is attached to the entity, and then call the method:
```c++
auto component = entity->GetComponent<HealthManager>();
if (component) component->TakeDamage(10);
```
