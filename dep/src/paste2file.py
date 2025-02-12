import win32clipboard
from PIL import Image
from io import BytesIO
import datetime

def get_clipboard():
    date_time = datetime.datetime.now().strftime("%m-%d-%Y_%H-%M-%S")
    win32clipboard.OpenClipboard()

    if win32clipboard.IsClipboardFormatAvailable(win32clipboard.CF_DIB):
        Image.open(BytesIO(win32clipboard.GetClipboardData(win32clipboard.CF_DIB))).save(f'{date_time}.png')

    else:
        with open(f'{date_time}.txt', 'w') as t:
            t.write(win32clipboard.GetClipboardData())
            
    win32clipboard.CloseClipboard()
    
if __name__=="__main__":
    get_clipboard()