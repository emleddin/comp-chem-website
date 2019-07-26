---
title: Commenting Out
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-commenting-out.html
folder: UNIX_guide
---

Something that makes scripting and file editing easier when an outsider is
reading them are comments.
Comments enable more detail about a code for anyone crazy enough to want to
understand it.
Basically, a comment is something that the computer knows to skip reading, so
it can contain anything.
Some lines that have been "commented out" are important, like the beginning
line of a bash script.
Other times, they could be deleted from the code without any affect.
The symbol to specify that a comment is forthcoming is `#`.
A comment ends when return has been hit.
The below script shows things that have been commented out.
```python
def is_cool (name) :               #def stands for define
	return (name == "I")

def person(name):
	if is_cool(name):
		print name, "am cool."    #print will print something to the screen
	else:
		print name, "are not cool."

person("I")       #Ah, look at these variables! You can see what I'm going for.
person("You")
```
Something helpful that some systems will do is that they color comments, so
you can actually tell that they've been commented out.
Python does this, which is why that example had gray `#` lines.


{% include links.html %}
