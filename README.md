# The DMV

This is the starter repo for the BE Mod1 DMV project.

**Reflection**
  1. Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.

      I started by reading through each file, side by side, one half had the application code and the other the corresponding spec file. If I noticed anything glaring, like misnamed methods or a missing attr_reader, I left a comment with my suspicions to remind myself when I started actually coming back to fix any bugs. During my reading of each file, I would switch as needed to see how they were linked via attributes / methods, to get a feel for which classes relied upon which. After that I then again went through each spec file and ran the tests, debugging each one error by error.

2. What was hard about working with code you did not write?

      Luckily it was easier than expected, since Ruby convention is laid out pretty nicely when followed. I did notice two things though: One - some of the files I have never seen before (dmv_data_service, Gemfile, Gemfile.lock), so that is tricky, working in a codebase that has concepts I haven't yet explored. Two - there was one stylistic choice in an attr_reader that had them entered down into a bulleted list, which was unpleasing to see.

3. What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

      What made it easy is definitely Ruby convention, meaning - the file names are all named after their class and class_spec, all variable names and methods are intuitively named. This definitely goes a long way when entering a code base that you haven't written.
