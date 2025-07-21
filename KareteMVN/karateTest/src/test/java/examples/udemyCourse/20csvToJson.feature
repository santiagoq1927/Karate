Feature: CSV to Json

  Scenario: Transform CSV to JSON
    * text myCSV =
"""
nombre,precio
Sal,3.45
Chocolate,5.67
"""
    * csv jsonTransform = myCSV
    * print jsonTransform
    * match jsonTransform == [{ "nombre": "Sal","precio": "3.45"},{"nombre": "Chocolate","precio": "5.67"}]