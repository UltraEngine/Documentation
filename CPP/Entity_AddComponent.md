# Entity::AddComponent

## Syntax

- shared_ptr<[Component](Component.md)\> **AddComponent**<T\>()
- shared_ptr<[Component](Component.md)\> **AddComponent**(const [Wstring](WString.md)& path)
- shared_ptr<[Component](Component.md)\> **AddComponent**(const ComponentHooks& hooks, void* extra)

| Parameter | Description |
|---|---|
| T | class type |
| path | path to Lua script |
| hooks | structure containing function pointers, for use with other languages |
  
## Returns

Returns a new component if successful, otherwise NULL is returned.
