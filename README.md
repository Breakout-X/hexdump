# hdump

So you thought this tool would have documentation? **Too bad.**

This is `hexdump`. It does what it says. It dumps hex.
If you're here expecting a well-commented codebase, a wiki, or even a usage example...  
sorry but you came to the wrong repository lmao.

The only thing that has comments is the `C` code. But beware of the JSON license.
For those of you who hate that license, *cry about it*.

---

## What does it do?

It dumps stuff. Or maybe it doesn't.  
Compile it, run it, scream into the void.  
I don't care.

---

## How do I use it?

You don't.  
But if you're feeling brave:

**Usage**:<br>
  `hdump <input>`<br>
  `hdump -o <input> <output>`<br>
  `hdump -np <input>`<br>
  `hdump -np -o <input> <output>`<br>
  `hdump -op <input>`<br>
  `hdump -op -o <input> <output>`<br>
**Flags**:<br>
  `-np`        No problem<br>
  `-op`        Only problems (ASCII only)<br>
  `-o`         Ow my toes<br>
  `-help`      Call 911<br>
  `-version`   no<br>
  `-v`         no<br>
  `-info`      And your address is...<br>
  `-i`         I am in your walls<br>
  `-license`   It's JSON<br>
  `--license`  Cry about it<br>

## How do I compile it:

Well if you can get over the fact that the documentation is basically useless, you can run these commands:

**Windows:**
```
tcc hdump.c -o hdump.exe
gcc hdump.s -o hdump.exe
```

**Linux:**
```
tcc hdump.c -o hdump
gcc hdump.s -o hdump
```

These are definetly the commands trust