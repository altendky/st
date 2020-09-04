#!/usr/bin/env python3

import os
import sys
import subprocess

subprocess.run(
    [
        sys.executable,
        os.path.join("sub", "epyqlib", "deploy_win.py"),
        *sys.argv[1:],
        # 		'--device-file', os.path.join('installer', 'devices.json'),
        "--name",
        "epyq",
    ]
)
