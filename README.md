# The DMV

This is the starter repo for the BE Mod1 DMV project.

# Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.

My first step was to read through all the code in the lib directory to get a sense of what the intention was. This helped me get a grasp of the code holisticaly and also ID areas where there were obvious problems. My next step was to run all the tests at in the spec directory at once to ensure that the testing suite was working and also flag files which I needed to look at. I would then run each spec file making a note of which tests failed (noteably the line number per our lesson today) and run them individually. Using each individual test as a guide I then went into the lib files and corrected elements until that test passed before moving onto the next. After reaching the end of the tests in any given file I reran all the tests at once to ensure my fixes did not break anything else.

# What was hard about working with code you did not write?

It was definitely a longer process than I expected to grasp what was happening with each of the files and even now I am still not 100% confident I understand every piece as deeply as I would like. It is a glaring difference from code that I pondered about and then wrote myself. 


# What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

Understanding the hash in the facility initialize method was made infinitely easier by being able to reference the vehicle initialize method. Since my experience with hashes is still limited, seeing that it work in vehcile but not in facility clued me in. However, I still spent time trying to google a solution before it occured to me to reference the other.