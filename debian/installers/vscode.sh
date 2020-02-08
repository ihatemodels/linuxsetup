#!/bin/bash

set -e

printf "\n[*] INSTALLING VSCODE..."
curl -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 > /dev/null 2>&1
sudo dpkg -i vscode.deb &> /dev/null

which code &> /dev/null

if [ $? -ne 0 ]; then
  banner "VSCODE FAILED"
else
  banner "VSCODE INSTALLED"
fi
