# The DMV

# Describe the steps you took to dig in to this code base. What was your process? If you don’t feel you had a process, define one that you might like to try next time.
I started by first looking through the four lib files and tried to layout the general structure of the code on a piece of paper. I realized the Facility class is the first class built --> then the DMV class uses the Facility class. The Vehicle class is a seperate class that doesnt rely on either Facility or DMV. The DMVDataSerice class is also a seperate class.
Based on this understanding, I started with the Facility class. I fixed the way it is initalized (pulling the attributes from the argument into a hash table), which took me a little time to realize after doing some research. I also fixed a spelling mistake in the add_service method.
I then expanded on this by looking at the DMV class. I looked at the error messages and realized an attr_reader was needed in order to access class attributes. I also changed the facilities_offering_service method to use a find_all enumerable instead of find, because only the first item was being returned previously. 
The Vehicle class errors indicated that there was no registration_date attribute, therefore I created this and added it to the attr_reader.


# What was hard about working with code you did not write?
Everyone writes code in different ways -- so to navigate someone elses formatting takes some time to get used to. Additionally, its just a lot to take in at once. Its much easier to start with one file, and then expand from there. Therefore, I think it is very important to be methodical when you are jumping into an established code base. 

# What was easier than you expected about jumping in to an unfamiliar codebase? What made it easy? If nothing felt easy, what would’ve helped you feel more comfortable more quickly?
The formatting was not drastically different than what we have previously seen - so it wasnt that difficult to get used to. The dmv_data_service file was the most difficult to analyze, but this was primarily due to the fact that this had a lot of code that we havent been exposed to yet.
