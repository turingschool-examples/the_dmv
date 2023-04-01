# The DMV

This is the starter repo for the BE Mod1 DMV project.

# Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.
*   I don't know how systematic my process was, but I began by looking at all the different files in the repo, some of which were new to me (such as gemfile.lock and spec_helper.rb). I figured that they existed in order to make certain things easier when it came to requiring things in spec files, which was neat to learn.

# What was hard about working with code you did not write?
*   It was hard to learn about instantiating an object of a class with a hash, and I went down a whole rabbit hole on that front. I had forgotten that the syntax of keys and their values can vary, so I thought that the arguement was being passed in as a code block, not a hash (so I thought I needed to do something with yield self and &block, but I was wrong.) I eventually asked a classmate for help, and they pointed out that it was a hash, so I was able to figure it out from there. Had it been my own code, I might have been more familiar with what was going on.

# What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

*  Given that we've been working with this general format of lib and spec files for a little while, it didn't feel entirely unfamiliar (thank goodness). While the code itself was unfamiliar, most of the syntax was familiar, and that was reassuring. I felt that the debugging process went fairly smoothly once I figured out the instantiation-via-hash aspect, and I liked the problem-solving nature of it.