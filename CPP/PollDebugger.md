# PollDebugger

This function periodically polls the script debugger to check for user actions.

## Syntax

- void **PollDebugger**(const int frequency = 500)

| Parameter | Description |
|---|---|
| frequency | maximum frequency of the action, in milliseconds |


## Remarks

For script debugging to work, the debugger must be enabled by running "Scripts/Modules/Debugger.lua".
