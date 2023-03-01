# Buffer::Poke

This method writes memory directly into a buffer from a memory pointer.

## Syntax

- void **Poke**(const uint64_t pos, const char* buf, const uint64_t size)

| Parameter | Description |
|---|---|
| pos | position in the buffer to write to |
| buf | memory pointer to read from |
| size | length of memory to copy, in bytes |
