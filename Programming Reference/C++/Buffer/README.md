# Buffer

The buffer class allows easy management of blocks of generic memory. These are used extensively within the engine itself, but can also be used as a low-level tool for advanced users.

# Members

- const uint64_t& size: Read-only variable that indicates the buffer size in bytes.
- const uint64_t& capacity: Read-only variable that indicates the buffer capacity in bytes.

# Methods

- [data]()
- [Resize]()
- [Clear]()
- [Poke]()
- [Peek]()
- [PokeByte]()
- [PokeInt]()
- [PokeFloat]()
- [PokeString]()
- [PokeShort]()
- [PokeDouble]()
- [PeekByte]()
- [PeekInt]()
- [PeekFloat]()
- [PeekShort]()
- [PeekDouble]()

# Functions

- [CreateBuffer]()
- [CreateStaticBuffer]()
- [LoadBuffer]()

# Examples
