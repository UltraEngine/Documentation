# Widget::Draw

This method is called each time the widget is redrawn.

## Syntax

- void **Draw**(const int x, const int y, const int width, const int height);

| Parameter | Description |
|---|---|
| x | screen coordinates of the block within the widget |
| y  | width and height of the block clipping region |
| width | block color |
| height | if set to true a rectangle outline will be drawn, otherwise a filled rectangle is drawn |
