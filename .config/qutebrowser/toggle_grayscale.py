# GRAYSCALE EVERYTHING
from qutebrowser.api import config as apiconfig, cmdutils
import os

style_on = '/home/erne/.config/qutebrowser/grayscale.css'
style_off = '/home/erne/.config/qutebrowser/nocolor.css'
flag_file = '/tmp/qutebrowser_grayscale_on'

cmdutils.register()
def toggle_grayscale():
    if os.path.exists(flag_file):
        config.set('content.user_stylesheets', style_off)
        os.remove(flag_file)
        print("Grayscale OFF")
    else:
        config.set('content.user_stylesheets', style_on)
        with open(flag_file, 'w') as f:
            f.write('on')
        print("Grayscale ON")


