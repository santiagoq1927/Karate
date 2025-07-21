Feature: Use of Scenario Outline with Examples

  Scenario Outline: El nombre de usuario es <nombre> y la edad es <edad>
    * def nombreUsuario = '<nombre>'
    * match nombreUsuario == "#? _ == 'Fer' || _ == 'Silvia'"
    * def titulo = karate.info.scenarioName
    * print titulo

    Examples:
      |nombre|edad|titulo|
      |Fer|39|El nombre de usuario es Fer y la edad es 39|
      |Silvia|50|El nombre de usuario es Silvia y la edad es 50|