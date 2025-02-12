import winreg as reg

paste_to_file_path = r"Directory\\Background\\shell\\Paste2File"
shell_path = r"Directory\\Background\\shell"

paste_to_file = reg.OpenKey(reg.HKEY_CLASSES_ROOT, paste_to_file_path)
reg.DeleteKey(paste_to_file, "command")

shell_key = reg.OpenKey(reg.HKEY_CLASSES_ROOT, shell_path)
reg.DeleteKey(shell_key, "Paste2File")