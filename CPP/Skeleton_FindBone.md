# Skeleton::FindBone

This method searches for a bone in the skeleton with the specified name.

## Syntax

- shared_ptr<[Bone](Bone.md)> **FindBone**(const [WString](WString.md) name, const bool cased = false)

| Parameter | Description |
|---|---|
| name | the bone name to search for |
| cased | if set to true the search will be case-sensitive |

## Returns

Returns a bone with the specified name if found, otherwise NULL is returned.
