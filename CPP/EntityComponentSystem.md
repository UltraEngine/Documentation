# Entity Component System

The Ultra Engine Entity Component System is a high-level API for developing games and simulations. The system provides a uniform structure that allows addition of modular logical components, without increasing the overall complexity of the program.

The entity component system consists of internal engine elements combined with a preprocessor that generates code for your game. The type of components that are available will vary depending on what code files you have present in your project directory.

### Actors

In the core Ultra Engine API you are accustomed to using entities. In the entity component system, the actor is our main object type. The actor poseesses an entity as and additional modular "blocks" of behavior called components. An actor has only one entity but can have multiple components.

### Components

Components are "blocks" of functionality that can be added to an actor.

### Connections

Actors can have connections defined that create a logical sequence of events when a method call occurs.

## Usage

To start using the entity component system, create an actor:

```c++
auto actor = CreateActor(entity);
```

You can add components to the actor like this:

```c++
actor->AddComponent<PlayerController>();
```

You can call any methods of any components, and all component methods by the same name will be called:

```c++
actor->Kill();
```

You also can call a method for just one specific component:

```c++
actor->GetComponent<PlayerController>()->Kill();
```

You access members of an individual component:

```c++
actor->GetComponent<PlayerController>()->health = 99;
```

But it is better to call a method, as this will call the same method for each component that has it:

```c++
actor->SetHealth(99);
```

You can copy an actor. The entity will be instantiated and all components will be copied to the new actor, with their current properties intact:

```c++
auto actor2 = actor->Copy();
```

The entity component system works together with the [World::Save](World_Save.md) method to save your entity components to a file and load them back into the program. This can be used for game saves or serializing the game state to send over a network to another player.
