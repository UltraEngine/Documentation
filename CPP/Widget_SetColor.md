# Widget::SetColor #
This method sets a widget's color value.

## Syntax ##
- void **SetColor**(const float r, const float g, const float b, const float a = 1.0f, const WidgetColor index = WIDGETCOLOR_BACKGROUND)
- void **SetColor**(const [Vec4](Vec4.md)& color, const WidgetColor index = WIDGETCOLOR_BACKGROUND)

| Parameter | Description |
| --- | --- |
| r | red component of the color to set |
| g | green component of the color to set |
| b | blue component of the color to set |
| a | alpha component of the color to set |
| color | color to set |
| index | color index |

## Remarks ##

 The color index can be any of the following values:

- WIDGETCOLOR_BACKGROUND
- WIDGETCOLOR_SUNKEN
- WIDGETCOLOR_RAISED
- WIDGETCOLOR_BORDER
- WIDGETCOLOR_FOREGROUND
- WIDGETCOLOR_SELECTION
- WIDGETCOLOR_HIGHLIGHT
- WIDGETCOLOR_SELECTEDTEXT
- WIDGETCOLOR_SLIDERARROW
- WIDGETCOLOR_SLIDERTRACK
- WIDGETCOLOR_SLIDERTRACKHOVERED
- WIDGETCOLOR_MENUBORDER
- WIDGETCOLOR_POPUP