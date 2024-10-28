# Entity::FindChild

This method searches the entity subhierarchy for a child with a specified name. Name searches are case-sensitive.

## Syntax

- shared_ptr<[Entity](Entity.md)\> **FindChild**(const [WString](WString.md)& name, const bool cased = true)
- int **FindChildren**(const [WString](WString.md)& name, vector<shared_ptr<[Entity](Entity.md)\>\> results, const bool cased = true)

| Parameter | Description |
| --- | --- |
| name | name of the entity to find |
| cased | if set to true the name search will be case-sensitive |
| results | all matching children will be added to the end of the array |

## Returns

Returns the first entity found with the specified name, or the number of children found.

## Remarks

This method can be used to find a single child or multiple children. An asterisk can be used in the name for pattern matching. For example FindChild("wheel*") would return a child named "wheel01" or "wheel_2".

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	auto parent = CreatePivot(NULL);

	auto child1 = CreatePivot(NULL);
	child1->SetParent(parent);
	child1->name = L"thing1";

	auto child2 = CreatePivot(NULL);
	child2->SetParent(parent);
	child2->name = L"thing_02";

	auto child3 = CreatePivot(NULL);
	child3->SetParent(parent);
	child3->name = L"thing";

	auto child4 = CreatePivot(NULL);
	child4->SetParent(parent);
	child4->name = L"_thing_04";

	vector<shared_ptr<Entity> > results;
	int count = parent->FindChild(L"thing*", results);

	Print("Found " + String(count) + " children:");
	for (auto child : results)
	{
		Print(child->name);
	}

	/*
	Output:

	Found 3 children:
	thing1
	thing_02
	thing
	*/

	return 0;
}
```
