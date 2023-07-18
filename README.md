# The DMV

## About
The DMV is a Mod 1, Week 2 project for Turing. The goal is to debug and expand upon an existing codebase, eventually using an API to build vehicles and facilities from external DMV data.<br/><br/>
As an extension, a SODA API was used to access New York's powerball lottery data, pulling the most recent 1,000 draws (limited due to not authenticating) and providing insight on the most frequently winning numbers. This can be viewed via the lottery_number_runner.rb file.

## Built With
- Ruby 3.1.4
- RSpec 3.12
- Faraday 2.7.2

## Getting Started
### DMV Portion
The DMV portion of the project has no runner file, so can be explored via pry/irb sessions, or via tests (see Testing below).
### The Lottery Portion
The lottery extension has a runner file capable of demoing its functionality - run via `ruby lottery_number_runner.rb`. Alternatively, a test suite is available (see Testing below).

## Testing
Full test suite can be run from the `the_dmv` directory with `rspec`. Full documentation flags are enabled by default.
Tests are broken out by class and further by method in the following format:
```
Class
  #method
    'test'
```