# The DMV

This is the starter repo for the BE Mod1 DMV project.

1. Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.

  - My first step was to peruse each spec file and run rspec to see what types of errors pop up.  I decided to work in the same order that was in the spec_helper.rb for debugging.  This proved to not be the correct order because dmv had instances of facilities in it's test.  After rechoosing the order to work on I used pry then moved on to debugging.

2. What was hard about working with code you did not write?

  - 

3. What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

  - I've never seen `before(:each) do`. It looks like it does the setup stage of the test and loops it for each individual test so you don't have to copy and paste each time.
  - `require 'spec_helper'` is also new and appears to allow you to only require spec_helper at the top and store the actual requires in a spec file. Another way to save time and space.
  - 