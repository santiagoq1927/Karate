Feature: validate file

  Scenario: validate a file
    * bytes data = read('result.json')
    * match data == read('result.json')