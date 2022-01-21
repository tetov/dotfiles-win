# Manual settings

## `about:config`
| Setting 						| Value  |
| ----------------------------------------------------- | ------ |
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` |
| `browser.link.open_newwindow.restriction`		| `0`    |

Regarding `browser.link.*` see <https://support.mozilla.org/en-US/questions/1258193>.

## `userChrome.css`

From [treestyletab | Code snippets for custom style rules](https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#for-userchromecss).

1. `about:support`
    * Profile Folder
    * Open Folder
1. Create folder `chrome`
1. Create file `userChrome.css`
1. Edit file.

```css
#main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
  opacity: 0;
  pointer-events: none;
}
#main-window:not([tabsintitlebar="true"]) #TabsToolbar {
    visibility: collapse !important;
}

/* Adding empty space for buttons */
#nav-bar {
	margin-right:140px;
}

/* 15px for dragging whole window by mouse*/
#titlebar {
	appearance: none !important;
	height: 15px;
}

/* Fix for main menu calling by Alt button */
#titlebar > #toolbar-menubar {
	margin-top: 10px;
}

/* Move minimize/restore/close buttons to empty space */
#TabsToolbar > .titlebar-buttonbox-container {
	display: block;
	position: absolute;
	top: 17px;
	right: 1px;
}

#sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
  display: none;
}

#sidebar {
  min-width: 100px !important;
}
```
