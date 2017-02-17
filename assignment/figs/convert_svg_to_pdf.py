#!/usr/bin/env python3

import os
import subprocess

cwd = os.path.dirname(os.path.abspath(__file__))

for root, dirs, files in os.walk(cwd):
    for fname in files:
        if fname.endswith(".svg"):
            fname_svg = fname
            fname_pdf = fname_svg.split(".svg")[0] + ".pdf"

            fname_svg_abs = os.path.abspath(os.path.join(root, fname_svg))
            fname_pdf_abs = os.path.abspath(os.path.join(root, fname_pdf))

            cmd = ["inkscape", "--export-area-drawing", fname_svg_abs, "--export-pdf=" + fname_pdf_abs]
            print(cmd)
            subprocess.call(cmd)
