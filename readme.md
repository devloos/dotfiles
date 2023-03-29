### System Config

- This is useful to set up my dev enviroment from scratch\*

### Package Manager List

> Not including dependencies

| **Brew**    | **Brew**               | **Brew**          | **PIP**               |
| ----------- | ---------------------- | ----------------- | --------------------- |
| lua         | neovim                 | node@16           | cmake-language-server |
| wget        | ripgrep                | luarocks          |
| libtool     | automake               | mongodb-community |
| symfony-cli | mongodb-database-tools | mongosh           |
| php         | heroku                 | tree-sitter       |
| cppcheck    | curl                   | llvm              |
| mysql       | python@3.10            | cmake

### Configs

- [VSCode Settings](https://github.com/Puwya/System-Config/blob/master/settings.json)
- [Git Config](https://github.com/Puwya/System-Config/blob/master/.gitconfig)
- [Cpp Setup Script]()
- [NVIM](https://github.com/Puwya/System-Config/tree/master/.config/nvim)

### System Apps

| Applications |         |                 |
| ------------ | ------- | --------------- |
| iTerm        | Outlook | Chrome          |
| VSCode       | Slack   | Notion          |
| Spotify      | Discord | MongoDB Compass |
| Postman      | Zoom    |

### Extensions

- [Activitus Bar](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.activitusbar)
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
- [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb)
- [cppcheck](https://marketplace.visualstudio.com/items?itemName=QiuMingGe.cpp-check-lint)
- [Java Debugger](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug)
- [Dev Container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Doxygen Comments](https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Javascript](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets)
- [Java](https://marketplace.visualstudio.com/items?itemName=redhat.java)
- [Material Icon](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- [PHP Debug](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug)
- [PHP](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Remote SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
- [Remote SSH Edit](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit)
- [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
- [VSCode Harpoon](https://marketplace.visualstudio.com/items?itemName=tobias-z.vscode-harpoon)

**[Extensions Config](https://github.com/Puwya/System-Config/blob/master/settings.json)**

### System

#### Terminal

> disables adding period when double spacing

`defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false`

> turns siri off

`defaults write com.apple.Siri StatusMenuVisible -bool false`

> these 3 commands set dock orientation left, enable scale effect, and turn on auto hide

`defaults write com.apple.dock orientation -string left`
`defaults write com.apple.dock mineffect -string scale`
`defaults write com.apple.dock autohide -bool true`

> removes recent applications from the dock

`defaults write com.apple.dock show-recents -bool false`

> adds background sounds to control center (note you still need to choose the sounds)

`defaults write com.apple.controlcenter "NSStatusItem Visible Hearing" -bool true`

> binds the escape to cap locks, so pressing cap locks result in esc being pressed

`hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'`

### Useful Commands

**BREW**

> List brew formulas without dependencies `brew leaves`

> Outdated Formulas `brew outdated`

**CPP**

> Run diagnostics on memory management (similar to valgrind) `leaks`
