# The DMV

This is the starter repo for the BE Mod1 DMV project.

1. Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.

  - My first step was to peruse each spec file and run rspec to see what types of errors pop up.  I decided to work in the same order that was in the spec_helper.rb for debugging.  This proved to not be the correct order because dmv had instances of facilities in it's test.  After rechoosing the order to work on, based on how to errors appeared when I ran rspec in the terminal, I used pry for debugging.

2. What was hard about working with code you did not write?

  - Not understanding what the person intended to start out with was difficult. Also not being confident in my coding skills made me hesitant to change anything too much. Since I was used to seeing initialize set up in a certain why I felt a little tinge of panic when I trying to alter it in facility.rb to accept hashes and how to even start searching- until I realized it was shown in vehicle.rb.  Being faced with new information seems to make me forget everything I've learned in the initial moments.

3. What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?

- Being more familiar with pry helped a lot. Knowing I could check for data-types this way and then use ruby.docs more eaily was rewarding.  Seeing methods I was familiar with like find vs find_all gave a littl confidence boost too!  

4. Haven't seen before?
  - I've never seen `before(:each) do`. It looks like it does the setup stage of the test and loops it for each individual test so you don't have to copy and paste each time.
  - `require 'spec_helper'` is also new and appears to allow you to only require spec_helper at the top and store the actual requires in a spec file. Another way to save time and space.
  - The Date Class was a really cool feature in Ruby as well.