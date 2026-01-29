Feature: Feature call other scenario with data

  Background:
    * table data
      |input|
      |1|
      |2|
      |3|
      |4|
      |7|

  Scenario:
    * def result = call read('18calledData.feature') data
