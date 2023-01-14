# Console

The console displays printed program output and allows the user to enter commands.

| Property | Type | Description |
|---|---|---|
| panel | shared_ptr<[Widget](Widget.md)> | main interface element panel |
| entry | shared_ptr<[Widget](Widget.md)> | textfield for entering  user input |
| log | shared_ptr<[Widget](Widget.md)> | textarea for displaying program output |
| erorrlog | shared_ptr<[Widget](Widget.md)> | listbox for displaying program errors |
| warninglog | shared_ptr<[Widget](Widget.md)> | listbox for displaying program warnings |
| errorbutton | shared_ptr<[Widget](Widget.md)> | button for selecting error display |
| warningbutton | shared_ptr<[Widget](Widget.md)> | button for selecting warning display |
| logbutton | shared_ptr<[Widget](Widget.md)> | button for selecting log display |
| AddMessage | Method | adds a warning, error, or line of text to the console |
| Clear | Method | clears the console log, error list, or warnings list |
