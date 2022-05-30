# WidgetItem #

This class contains an item in a listbox or combobox widget.

### Properties ###

| Name | Type | Description |
| --- | --- | --- |
| text | const WString& | read-only widget item text |

		float iconscale;
		WString text;
		shared_ptr<Icon> icon;
		shared_ptr<Pixmap> pixmap;
		shared_ptr<Object> extra;
		WidgetState state;
