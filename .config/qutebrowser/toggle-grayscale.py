#!/usr/bin/env python3
import os
from pathlib import Path

qute_config = Path.home() / ".config/qutebrowser/config.py"
style_on = str(Path.home() / ".config/qutebrowser/grayscale.css")
style_off = str(Path.home() / ".config/qutebrowser/nocolor.css")

with open(qute_config, "r") as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    if line.strip().startswith("config.set('content.user_stylesheets'"):
        if style_on in line:
            line = f"config.set('content.user_stylesheets', '{style_off}')\n"
        else:
            line = f"config.set('content.user_stylesheets', '{style_on}')\n"
    new_lines.append(line)

with open(qute_config, "w") as f:
    f.writelines(new_lines)

