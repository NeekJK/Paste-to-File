import os
import sys
import winreg as reg

cwd = os.getcwd() + "\\src\\"
python_exe = sys.executable
key_path = r"Directory\\Background\\shell\\Paste2File"

key = reg.CreateKeyEx(reg.HKEY_CLASSES_ROOT, key_path)
reg.SetValue(key, '', reg.REG_SZ, '&Paste as file')
reg.SetValueEx(key, 'Icon', 0, reg.REG_SZ, f"{cwd}paste2file.ico")

key1 = reg.CreateKeyEx(key, r"command")
reg.SetValue(key1, '', reg.REG_SZ, python_exe + " " + f'"{cwd}paste2file.py"')

