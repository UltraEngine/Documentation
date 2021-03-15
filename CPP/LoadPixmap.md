# LoadPixmap

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> LoadPixmap(const WString& path, const int miplevel = 0, const int face = 0, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Pixmap](Pixmap.md)\> LoadPixmap(shared_ptr<[Pixmap](Stream.md)\>, const int miplevel = 0, const int face = 0, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load the pixmap from |
| stream | stream to load the pixmap from |
| miplevel | optional mipmap level to load |
| face | optional texture face to load |
| flags | optional load flags |

## Returns
Returns the loaded pixmap, or NULL if no pixmap was loaded.
