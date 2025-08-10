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

---

## How do I compile it:

Well if you can get over the fact that the README documentation is basically useless, 
you can run these commands:

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

---

## Why is the default branch called `master`?

Because I didn't feel like renaming it to `main` just to make anyone feel better 
about themselves.

If the word "master" offends you somehow in the context of a code branch, **too bad**.
Since this was the default branch name in the past, I'm sticking with it.

---

## Why is the license `JSON` of all things

Because I find it actually stupid that people hate on the one line 
"The Software shall be used for Good, not Evil." so much.

If that line is so offensive or "non-free" as OSI calls it, maybe ask yourself 
why you hate it so much.

The license is literally just MIT but asking you not to be a jerk. 
Although I honestly could care less if you used `hexdump` as a tool to hack people for your own selfish
gain, at the same time we all know that doing something like that would clearly be evil.

Also, literally the creator of the JSON license confirmed that the reason 
he put that quote in there was as a freaking joke.