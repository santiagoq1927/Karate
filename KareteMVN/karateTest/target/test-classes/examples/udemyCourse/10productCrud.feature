Feature: product end point

  Background:
    * url 'http://localhost:8082'

  Scenario: Crud product
    Given path '/mercado'
    And request {nombre:'Tortillas', cantidad:69, precio:1.27}
    When method POST
    Then status 200
    And match response == {id:'#number', nombre:'Tortillas', cantidad:'#number', precio:1.27}

    * def identificador = response.id

    #get by id
    Given path '/mercado', identificador
    When method GET
    Then status 200
    And match response contains {id:'#(identificador)', nombre: '#string'}

    #update
    Given path '/mercado', identificador
    And request {id: '#(identificador)', nombre:'Champignones', cantidad:2, precio:7.90}
    When method PUT
    Then status 200
    And match response contains {id:'#(identificador)', nombre: 'Champignones'}

    #list
    Given path '/mercado'
    When method GET
    Then status 200
    And print "-- Lista de Productos --"
    And print response

    #delete whit id
    Given path '/mercado', identificador
    When method DELETE
    Then status 200

    #delete whit body
    Given path '/mercado'
    And request {id: '#(identificador)', nombre:'Champignones', cantidad:2, precio:7.90}
    When method DELETE
    Then status 500

    #list
    Given path '/mercado'
    When method GET
    Then status 200
    And print "-- Lista de Productos --"
    And print response




