# Entity::FindChild #
This method searches the entity subhierarchy for a child with a specified name. Name searches are case-sensitive.

## Syntax ##
- shared_ptr<[Entity](CPP_Entity_32f.md)\> **FindChild**(const string& name, const bool casesensitive = true)
- shared_ptr<[Entity](CPP_Entity_32f.md)\> **FindChild**(const wstring& name, const bool casesensitive = true)
- int **FindChild**(const string& name, vector<shared_ptr<[Entity](CPP_Entity_32f.md)\>\> results, const bool casesensitive = true)
- int **FindChild**(const wstring& name, vector<shared_ptr<[Entity](CPP_Entity_32f.md)\>\> results, const bool casesensitive = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **name** | name of the entity to find |
| **casesensitive** | if set to true the name search will be case-sensitive |
| **results** | all matching children will be added to the end of the array |

## Returns ##
Returns the first entity found with the specified name, or the number of children found.

## Remarks ##
This method can be used to find a single child or multiple children. An asterisk can be used in the name for pattern matching. For example FindChild("wheel*") would return a child named "wheel01" or "wheel_2".

## Example ##
```c++
#include "pch.h"
#include "Project.h"

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

	return 0;
}
```
