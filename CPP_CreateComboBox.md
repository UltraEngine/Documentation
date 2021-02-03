# CreateComboBox #

The button widget can be used to create push buttons, checkboxes, radio buttons, and toolbar items. Buttons emit a WIDGETACTION event when pushed. Some styles use the widget state to indicate whether they are selected.

## Syntax ##

- shared_ptr<Widget\> **CreateComboBox**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const ComboBoxStyle = COMBOBOX_DEFAULT)

| Parameter | Description |
| --- | --- |
| text | widget text |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional combobox style, can be COMBOBOX_DEFAULT or COMBOBOX_EDTABLE |

## Example ##
```c++

```
