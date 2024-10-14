# LoadPrefab

This function loads an entity from a prefab file.

## Syntax

- std::shared_ptr<Entity> LoadPrefab(shared_ptr<World> world, const WString& path, const LoadFlags flags = LOAD_DEFAULT, shared_ptr<Object> extra = nullptr);

| Parameter | Description |
|---|---|
| world | world to create the entity in |
| path | file path of the file to load | 
| flags | loading flags |
| extra | extra object that will be passed to [Component::Load](Component.md) calls |
