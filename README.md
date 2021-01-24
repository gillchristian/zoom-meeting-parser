# zoom-meeting-parser

Parse Zoom meeting invitation and print it nicely (in Spanish).

### How it works

Parse a Zoom meeting invitation:

```
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

Into a short version:

```
**Some topic**
Horario: Enero 22, 2021 09:30 PM Amsterdam

Link de la reunión:
https://us02web.zoom.us/j/00000000000?pwd=xxxxxxxxx

Contraseña: 000000
```

### Install

```
git clone git@github.com:gillchristian/zoom-meeting-parser.git
cd zoom-meeting-parser
stack install .
```

### Use

Requires `xclip` to be installed.

A Zoom meeting invitation needs to be copied in the clipboard.

```
$ zum
Could not parse Zoom meeting inviation.

Did you forget to copy i?
```

```
$ zum
Zoom meeting inviation parsed succesfully :)
**Some topic**
Horario: Enero 22, 2021 09:30 PM Amsterdam

Link de la reunión:
https://us02web.zoom.us/j/00000000000?pwd=xxxxxxxxx

Contraseña: 000000
```

Pipe into `xclip -selection c` to copy to the clipboard

```
$ zum | xclip -sel c
Zoom meeting inviation parsed succesfully :)
```
