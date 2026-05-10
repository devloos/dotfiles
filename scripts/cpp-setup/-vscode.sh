#!/bin/bash
echo '{
  "configurations": [
    {
      "name": "{PROJECT_NAME}",
      "includePath": [
        "${workspaceFolder}",
        "${workspaceFolder}/include",
        "${workspaceFolder}/src"
      ],
      "cppStandard": "c++20",
      "compilerPath": "/usr/bin/clang",
      "cStandard": "c17",
      "intelliSenseMode": "macos-clang-arm64"
    }
  ],
  "version": 4
}' > .vscode/c_cpp_properties.json

echo '{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug (lldb)",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceFolder}/build/{EXECUTABLE}",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceFolder}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "lldb"
    }
  ]
}' > .vscode/launch.json

echo '{}' > .vscode/settings.json
