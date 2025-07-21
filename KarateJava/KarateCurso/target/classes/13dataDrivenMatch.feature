Feature: Definition of variables and matches

Scenario:
* def nombreUsuario = "Fer"
* def edadUsuario = 39
* def validoUsuario = false

* set output
|path|value|
|nombre|nombreUsuario|
|edad|edadUsuario|
|valido|validoUsuario|

* match output == {nombre: "Fer", edad: 39, valido: true}
