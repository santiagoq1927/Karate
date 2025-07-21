Feature: validate a File

Scenario: Validate a file
* bytes data = read('result.json')
* match data == read('result.json')