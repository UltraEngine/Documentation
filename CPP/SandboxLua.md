# SandboxLua

By default, Lua scripts do not have access to features that could potentially cause harm to the host machine, such as file write access or operating system commands. This function can be used to disable Lua sandboxing and grant elevated scripts elevated permissions.

**WARNING: Disabling Lua sandboxing can potentially make your computer vulnerable to malicious scripts. Do not run scripts with sandboxing disabled unless you trust the contents of the script.**

## Syntax

- void **SandboxLua**(const bool sandboxmode)

| Parameter | Description |
|---|---|
|sanboxmode| if set to true sandboxing is enabled, otherwise it is disabled |
