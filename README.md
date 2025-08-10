# hdump

So you thought this tool would have documentation? **Too bad.**

This is `hexdump`. It does what it says. It dumps hex.
If you're here expecting a well-commented codebase, a wiki, or even a usage example...  sorry but you came to the wrong repository lmao.

The only thing that has comments is the c code. But beware of the JSON license.
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

**Usage**:
  `hdump <input>`
  `hdump -o <input> <output>`
  `hdump -np <input>`
  `hdump -np -o <input> <output>`
  `hdump -op <input>`
  `hdump -op -o <input> <output>`
**Flags**:
  `-np`        No problem
  `-op`        Only problems (ASCII only)
  `-o`         Ow my toes
  `-help`      Call 911
  `-version`   no
  `-v`         no
  `-info`      And your address is...
  `-i`         I am in your walls
  `-license`   It's JSON
  `--license`  Cry about it

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