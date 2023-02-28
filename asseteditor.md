# Asset Editor

The asset editor is in a separate window. You can open any asset by double-clicking it in the [asset browser](assetbrowser.md). The item will appear in a new tab in the asset editor window.

## Side Panel

The side panel contains file information and tools for editing the asset....

## Scripting API

| Property | Type | Description |
|---|---|---|
| tabber | [Widget](Widget.md) | main tabbed panel |
| closebutton | [Widget](Widget.md) | offscreen button with BUTTON_ESCAPE style |
| window | [Window](Window.md) | main interface window |
| splitter | [SplitPanel](SplitPanel.md) | main interface split panel |
| viewport | [Window](Window.md) | viewport window for 3D rendering |
| assets | Table | array of opened asset files |
| [SaveFile](asseteditor_savefile) | Method | saves an opened file |
