# Component

This class can be extended to add behavior and properties to an [Actor](Actor.md).

| Property | Type | Description |
|---|---|---|
| entity | shared_ptr<[Entity](Entity.md)\> | entity this component's actor contains |
| [GetActor](Component_GetActor.md) | Function | retrieves the actor this component is attached to |

No:
```c++
void HealthManager::TakeDamage(const int damage)
{
  health -= damage;
  if (health <= 0) this->Kill();
}
```
Yes:
```c++
void HealthManager::TakeDamage(const int damage)
{
  health -= damage;
  if (health <= 0) GetActor()->Kill();
}
```
