Feature: JSON Dynamic

  Scenario: Modify dynamic JSON
    * def producto = { nombre: "Sal"}
    * print producto
    * def key = 'cantidad'
    * producto[key] = 23
    * print producto
    * match producto == {nombre: "Sal",cantidad: 23}
    * karate.remove('producto', '$.'+key)
    * print producto
    * karate.set('producto', '$.precio', 3.45)
    * print producto
    * karate.set('producto', '$.marcas[]', {nombre: 'SAL MARCA BLANCA'})
    * print producto
