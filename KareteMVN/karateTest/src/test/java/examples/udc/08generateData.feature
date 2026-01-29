Feature: Generate whit repeat

  Scenario: return list
    * def fun = function(i){return i*2}
    * def listResults = karate.repeat(3,fun)
    * print listResults
    * match listResults == [0,2,4]

  Scenario: add elements to array
    * def arrayEmpty = []
    * def fun = function(i){arrayEmpty.push(i)}
    * karate.repeat(3, fun)
    * match arrayEmpty  == [0,1,2]

  Scenario: add elements to array with count in def
    * def count = 3
    * def fun = function(i){return {value: i}}
    * def arrayEmpty = karate.repeat(count, fun)
    * match arrayEmpty == [{value: 0}, {value: 1}, {value: 2}]