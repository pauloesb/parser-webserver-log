# Parser Webserver Log
[![Ruby](https://img.shields.io/badge/ruby-v2.7.2-blue.svg)](https://github.com/ruby/ruby) [![RSpec](https://img.shields.io/badge/rspec-v3.10.0-blue.svg)](https://github.com/rspec) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

## Usage Requirements
1. Make sure you have Ruby 2.7.2 installed and the repository cloned correctly
2. First execute the following command below to install the dependences required
    ```
    $ bundle install
    ```
3. In order to execute the parser webserver log just use the following command below
    ```
    $ ./parser.rb webserver.log
    ```

## Test Coverage
- RSpec with **97.27%** coverage

![RSpec](https://i.ibb.co/Ch35Lmf/Screen-Shot-2022-01-16-at-2-25-05-PM.png "RSpec")

- Rubocop without offenses

![Rubocop](https://i.ibb.co/288h1Jt/Screen-Shot-2022-01-16-at-10-43-43-PM.png "Rubocop")

## Architecture

- File Structure

![File Structure](https://i.ibb.co/yQhDcXg/Screen-Shot-2022-01-16-at-10-36-03-PM.png "File Structure")

The architecture is divided in two main parts:
- lib/parser/domains
- lib/parser/models

The `parser.rb` is the script responsible to fetch the `ARGV` with the filepath of the log in order to execute `Parser::Analyzer.start`. The `Parser::Analyzer` is just a module with a `.start` function responsible to execute `Parser::Reader` that will parse the log lines into objects and return it to the business domain classes responsible to execute their logic.

The `lib/parser/domains` is where the business logic files stays, where it defines the `reader.rb`, `views/page`, `views/most` and `views/unique` rules. These files contains the logic to use the object with the lines correctly to print what is expected from them. Inside `view` it's defined `Page` where's the logic is defined for the execution of view of the data for `most` and `unique` logic, they inherit from `page` and each class it defines it's own unique responsibility.

The `lib/parser/model` is just a place to wrapper the representation of the line of each log line, but we can increase the number of models depending on the evolution of the scope.

## Next Steps

- Add more Terminal control with the possibility to select the options that you want, for example if the user only wants the most views or the unique ones only
- Enable the possibility to deal with multiple type of logs beside of webserver.logs, we can evolve this script to deal with any kind of scripts, by turning the reader into more generic class and writting specialized classes for each kind of reader
- Add more options of visualization depending on the new kinds of the logs that are going to be compatible with the script
- Embed into a Gem for usage in projects such web projects and other kinds

## Author
- Paulo Eduardo Souza Borba
- pauloesb@gmail.com
- 16/01/2022