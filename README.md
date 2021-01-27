# zoom-meeting-parser

Parse Zoom meeting invitation and print it nicely (in Spanish).

### Install

```
git clone git@github.com:gillchristian/zoom-meeting-parser.git
cd zoom-meeting-parser
stack install .
```

### Use

Having a Zoom invitation on the clipboard.

```
$ xclip -o -sel c
John Doe is inviting you to a scheduled Zoom meeting.

Topic: Some topic
Time: Jan 22, 2021 09:30 PM Amsterdam

Join Zoom Meeting
https://us02web.zoom.us/j/00000000000?pwd=xxxxxxxxx

Meeting ID: 999 9999 9999
Passcode: 000000
One tap mobile
+99999999999,,99999999999#,,,,*777777# US (New York)
+99999999999,,99999999999#,,,,*777777# US (Washington D.C)

Dial by your location
        +1 000 000 0000 US (New York)
        +1 000 000 0000 US (Washington D.C)
        +1 000 000 0000 US (Chicago)
        +1 000 000 0000 US (San Jose)
        +1 000 000 0000 US (Tacoma)
        +1 000 000 0000 US (Houston)
Meeting ID: 999 9999 9999
Passcode: 999999
Find your local number: https://us02web.zoom.us/u/xxxxxxxxxx
```

Pipe it into `zoom-meeting-parser`.

```
$ xclip -o -sel clip | zoom-meeting-parser
Zoom meeting inviation parsed succesfully :)
**Some topic**
Horario: Enero 22, 2021 09:30 PM Amsterdam

Link de la reunión:
https://us02web.zoom.us/j/00000000000?pwd=xxxxxxxxx

ID de la reunión: 999 9999 9999
Contraseña: 000000
```

Pipe into `xclip -selection c` to copy the short version back to the clipboard.

```
$ xclip -o -sel c | zoom-meeting-parser | xclip -sel c
Zoom meeting inviation parsed succesfully :)
```
