# Entity Component System #
The Ultra Engine Entity Component System is a high-level API for developing games and simulations. The system provides a uniform structure that allows addition of modular logical components, without increasing the overall complexity of the program.

## Actors ##
In the base API you are accustomed to using entities. In the entity component system, the actor is our main object type. The actor poseesses an entity as and additional modular "blocks" of behavior called components. One actor has only one entity, and one entity can only have one actor, but an actor may have many different components.

## Components ##
Components are "blocks" of functionality that can be added to an actor.

## Connections ##
Actors can have connections defined that create a logical sequence of events when a method call occurs.