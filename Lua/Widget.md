# Widget

Base class: [Object](Object.md)

This class handles user interface elements. A variety of widget types are supported. You can also create [custom widgets](CustomWidgets.md) by extending this class.

| Property | Type | Description |
|---|---|---|
| blocks | const table | read-only container of widget blocks |
| items | const table | read-only items list |
| kids | const table | read-only container of child widgets |
| size | const table | read-only widget size |
| text | const string | read-only widget text |
| AddBlock() | Method | adds a widget block |
| AddItem() | Method | adds a widget item |
| AddNode() | Method | adds a node to a treeview widget |
| ClearItems() | Method | removes all widget items |
| ClientSize() | Method | returns the client area |
| DoubleClick() | Method | called when a mouse button is clicked twice in rapid succession |
| Draw() | Method | called each time the widget is redrawn |
| GetItemText() | Method | gets the widget item text |
| GetHidden() | Method | returns the widget visibility |
| GetInterface() | Method | gets the widget interface |
| GetParent() | Method | returns the widget parent |
| GetPosition() | Method | gets the button position |
| GetSelectedItem() | Method | gets the selected widget item |
| GetSelectedNode() | Method | gets the selected treeview node |
| GetSize() | Method | gets the widget size |
| GetState() | Method | gets the widget state |
| GetText() | Method | gets the widget text |
| GetValue() | Method | gets a slider's value |
| GainFocus() | Method | called when the widget is selected |
| KeyChar() | Method | called when a keyboard character is entered |
| KeyDown() | Method | called when a keyboard key is pressed |
| KeyUp() | Method | called when a keyboard key is released |
| LoseFocus() |  Method | called when the widget is deselected |
| MouseDown() |  Method | called when a mouse button is pressed |
| MouseEnter() |  Method | called when the mouse cursor enters the active window bounds |
| MouseLeave() |  Method | called when the mouse cursor leaves the active window bounds |
| MouseMove() |  Method | called whenever the mouse moves, with coordinates relative to the active window |
| MouseUp() |  Method | called when a mouse button is released |
| MouseWheel() |  Method | called when the mouse wheel turns |
| Paint() | Method | redraws a widget |
| RemoveItem() | Method | removes a widget item |
| SetColor() | Method | sets the widget color |
| SetFontBold() | Method | sets the widget font weight |
| SetFontScale() | Method | sets the widget font scale |
| SetHidden() | Method | hides or shows the widget |
| SetIcon() | Method | applies an icon to the widget |
| SetInteractive() | Method | applies an icon to the widget |
| SetItemState() | Method | modifies the item state |
| SetItemText() | Method | modifies the item text |
| SetLayout() | Method | controls the way a widget behaves during resizing |
| SetParent() | Method | makes this widget the child of the parent widget |
| SetPixmap() | Method | applies a pixmap to the widget |
| SetProgress() | Method | sets the progress complete for a progress bar widget |
| SetShape() | Method | sets the widget position and size |
| SetRange() | Method | sets the range of a slider widget |
| SetState() | Method | sets the button state |
| SetText() | Method | sets the widget color |
| SetTexture() | Method | applies a texture to a widget in a 3D interface |
| SetValue() | Method | sets the value of a slider |
| SelectItem() | Method | selects a widget item |
| SelectNode() | Method | selects a treeview node |
| TripleClick() |  Method | called when a mouse button is clicked rapidly three times |
| CreateButton() | Function | creates a button widget |
| CreateComboBox() | Function | creates a combobox widget |
| CreateLabel() | Function | creates a label widget |
| CreateListBox() | Function | creates a listbox widget |
| CreateMenu() | Function | creates a menu widget |
| CreatePanel() | Function | creates a panel widget |
| CreateProgressBar() | Function | creates a progress bar widget |
| CreateSlider() | Function | creates a slider widget |
| CreateTextArea() | Function | creates a text area widget |
| CreateTextField() | Function | creates a text field widget |
| CreateTreeView() | Function | creates a treeview widget |