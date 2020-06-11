# Entity::AddActor #
This method adds an actor to an entity. An actor is a user-defined class derived from the base [Actor](CPP_Actor.md) class that can be used to add behaviors to an entity.

## Syntax ##
- void **AddActor**(shared_ptr<[Actor](CPP_Actor.md)> actor, const bool callstart = true);

### Parameters ###
| Name | Description |
| - | - |
| actor | actor to add |
| callstart | if set to true, the actor Start method will be called |
