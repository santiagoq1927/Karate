Feature: Feature call a tag of a scenario

  Scenario: Scenario call a tag of another scenario
    * def readed = call read('calledTag.feature@name=second')
    * match readed.nombre == 'Silvia'