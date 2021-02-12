# AnimationStats #
This class contains information about the animation threads. To enable statistics recording, you must call the [World::RecordStats](World_RecordStats.md) method.

| Property | Type | Description |
| ----- | ----- | ----- |
|		 bones | int | Number of bones updated in the previous frame. |
|		 skeletons | int | Number of skeletons updated in the previous frame. |
| 		 threads | int | Number of animation threads currently in use. |
|		 time | int | Combined time taken to update animations, in milliseconds. |
