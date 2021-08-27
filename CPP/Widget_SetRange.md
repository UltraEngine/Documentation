# Widget::SetRange

This method sets the range of a slider widget.

## Syntax

- void **SetRange**(const int x, const int y)

| Parameter | Description |
|---|---|
| x | minimum value for a stepper or trackbar, or visible range for a scrollbar  |
| y | maximum value for a stepper or trackbar, or total range for a scrollbar |

## Remarks

If this method is used with a slider widget that uses the STEPPER slider style, the x value will be the minimum value and the y parameter will be the maximum value returned by [Widget::GetValue](Widget_GetValue.md).

If this method is used with a slider widget that uses the TRACKBAR slider style, the x value will be the value [Widget::GetValue](Widget_GetValue.md) returns when the trackbar knob is all the way to the left (or up, for a vertical slider) and the y value is the value that will be returned when the slider knob is all the way to the right (or bottom).

If this method is used with a slider widget that uses the SCROLLBAR slider style, the x value will be the range the handle takes up, and the y value will be the total range of the entire bar excluding the arrow buttons at the ends. For example, calling **SetRange**(1,10) would make the scrollbar handle take up 10% the total length of the bar.

## Example

```c++

```
