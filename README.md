# The DMV

## Debugging Process

The existing codebase for this project had a few bugs in its basic functionality. By checking the existing rspec tests against the code for each class, one at a time, I was able to see how the whole codebase should work together and fix the bugs in the way.

Thankfully, the code and tests were well-written from a human/developer empathy standpoint, and because the codebase uses common class and method types, I was able to understand how everything should work and add my own code to help it get there.

## Refactoring

After implementing solutions for the required functionality, I looked at some of my methods and realized they could be done more efficiently. For example, when calculating the most popular car in VehicleAnalyzer, I iterated twice through a collection to count the cars and then find the car with the most registrations. I showed my method to ChatGPT and got the max_by method as well as some simplifying syntax suggestions. I continued to search for inefficiencies in my code and simplify wherever possible.