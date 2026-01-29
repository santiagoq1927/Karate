Feature: product endpoint

  Background:
    * url 'http://localhost:8082'
    * configure headers = {Accept: 'application/xml'}

  Scenario: Post/Get by ID product with XML
    Given path '/mercado'
    And request <producto><nombre>Chocolate</nombre><cantidad>89</cantidad><precio>1.45</precio></producto>
    When method POST
    Then status 200
    And match response == <producto><id>#notnull</id><nombre>#string</nombre><cantidad>89</cantidad><precio>1.45</precio></producto>
    And print response
    * def identificador = /producto/id
    * print '---- IDENTIFICADOR ----- '
    * print identificador

    Given path '/mercado', identificador
    When method GET
    Then status 200
    And match response == <producto><id>#(identificador)</id><nombre>#string</nombre><cantidad>89</cantidad><precio>1.45</precio></producto>