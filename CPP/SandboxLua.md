# SandboxLua

**WARNING: Disabling Lua sandboxing can potentially make your computer vulnerable to malicious scripts. Do not run scripts with sandboxing disabled unless you trust the contents of the script.**

By default, Lua scripts do not have access to features that could potentially cause harm to the host machine, such as file write access or operating system commands. This function can be used to disable Lua sandboxing and grant elevated scripts elevated permissions. This function must be called at the beginning of the program, before any other functions are executed.

## Syntax

- void **SandboxLua**(const bool sandboxmode)

| Parameter | Description |
|---|---|
|sandboxmode| if set to true sandboxing is enabled, otherwise it is disabled |
