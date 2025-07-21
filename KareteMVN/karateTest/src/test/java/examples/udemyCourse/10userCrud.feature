Feature: product end point

  Background:
    * url 'http://localhost:8082'

  Scenario: Crud user
    Given path '/empresa'
    And request {nombre:'Antony', apellido:'De Avila', edad:52}
    When method POST
    Then status 200
    And match response == {id:'#number', nombre:'Antony', apellido:'#string', edad:52}

    * def identificador = response.id

    #get by id
    Given path '/empresa', identificador
    When method GET
    Then status 200
    And match response contains {id:'#(identificador)', nombre: '#string'}

    #update
    Given path '/empresa', identificador
    And request {id: '#(identificador)', nombre:'Juan', apellido:'Quintero', edad:33}
    When method PUT
    Then status 200
    And match response contains {id:'#(identificador)', nombre: 'Juan'}

    #list
    Given path '/empresa'
    When method GET
    Then status 200
    And print "-- Lista de Usuarios --"
    And print response

    #delete whit id
    Given path '/empresa', identificador
    When method DELETE
    Then status 200

    #delete whit body
    Given path '/empresa'
    And request {id: '#(identificador)', nombre:'Juan', apellido:'Quintero', edad:33}
    When method DELETE
    Then status 500

    #list
    Given path '/empresa'
    When method GET
    Then status 200
    And print "-- Lista de Usuarios --"
    And print response




