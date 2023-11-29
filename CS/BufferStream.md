# BufferStream

This class provides a mechanism to read from and write to a block of memory as if it were a file.

Base class: [Stream](Stream.md)

| Property | Type | Description |
| ---- | ---- | ----------- |
| data | `const System.IntPtr` | read-only stream data buffer |
| [CreateBufferStream](CreateBufferStream.md) | `Func<System.IntPtr, BufferStream>` | Creates a new BufferStream object. |

### Syntax

#### CreateBufferStream

```csharp
public static BufferStream CreateBufferStream(System.IntPtr data);
```

### Examples

#### Creating a BufferStream

```csharp
System.IntPtr data = GetBufferData();
BufferStream stream = BufferStream.CreateBufferStream(data);
```