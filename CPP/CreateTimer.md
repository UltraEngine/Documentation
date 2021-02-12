# CreateTimer #
This function creates a new timer object. A timer emits a TIMERTICK event at a regular frequency.

## Syntax ##
- shared_ptr<[Timer](Timer.md)\> **CreateTimer**(const int frequency)

### Parameters ###
| Name | Description |
| --- | --- |
| frequency | timer frequency in milliseconds |

## Returns ##
Returns a new timer object.

## Example ##