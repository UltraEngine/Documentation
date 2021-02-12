# Widget::AddBlock #
This method adds a visual element to a widget. It can be used to add a solid or wireframe rectangle, a string of text, or an image.

## Syntax ##
- int AddBlock(const iVec2& position, const iVec2& size, const bool wireframe = false, const Vec4& color = Vec4(1))
- int AddBlock(const WString& text, const iVec2& position, const iVec2& size, const Vec4& color = Vec4(1))
- int AddBlock(shared_ptr<Pixmap> pixmap, const iVec2& position)