#!/bin/bash

echo '{
  "env": {
    "myDefaultIncludePath": ["${workspaceFolder}", "${workspaceFolder}/include"]
  },
  "configurations": [
    { 
      "name": "mac",
      "includePath": ["${myDefaultIncludePath}"]
    }
  ],
  "version": 4
}' > .vscode/c_cpp_properties.json

echo '{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "lldb",
      "request": "launch",
      "name": "Debug",
      "program": "${workspaceFolder}/build/{EXECUTABLE}",
      "args": [],
      "cwd": "${workspaceFolder}/build"
    }
  ]
}' > .vscode/launch.json

echo '{
	"C_Cpp.default.cppStandard": "c++20",
	"C_Cpp.default.cStandard": "c17",
	"C_Cpp.default.compilerPath": "/usr/bin/clang",
	"C_Cpp.default.intelliSenseMode": "macos-clang-x64",

	"C_Cpp.clang_format_path": "/usr/local/bin/clang-format",
	"[cpp]": {
		"editor.formatOnSave": true
	},
}' > .vscode/settings.json