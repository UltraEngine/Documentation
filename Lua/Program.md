# Program

This class contains 

| Property | Type | Description |
|---|---|---|
| title | string | |
| mainpanel | Panel | |
| menu | Menu | |
| world | World | |
| window | Window | |
| sidepanel | TabbedPanel | |
| assetbrowser | AssetBrowser | |
| ResetLayout | Method | resets the interface to the default layout |
| UpdateLayout | Method | adjusts the shape of the main panel elements based on the visibility of the toolbar, object bar, and status bar |
| Quit | Method | exits the program |


- mainpanel
  - mainsplitter
   - mainsplitter.kids[1]
     - toolbar
     - subsplitter
       - viewpanel
         - viewport[1]
         - viewport[2]
         - viewport[3]
         - viewport[4]
       - console
     - statusbar
     - objectbar
   - mainsplitter.kids[2]
     - sidepanel
       - sidepanel.kids[1]
         - assetbrowser
       - sidepanel.kids[2]
         - scenebrowser
