Feature: user of data driven

  Background:
    * url 'http://localhost:8082'

    Scenario Outline: create product by data driven
      Given path '/mercado'
      And request {nombre:<nombre>, cantidad:<cantidad>, precio:<precio>}
      When method POST
      Then status 200
      And match response == {id:'#number', nombre:'#string', cantidad: '#number', precio:7.99}

      * def identifcador = response.id

      # get by id
      Given path '/mercado', identifcador
      When method GET
      Then status 200
      And match response contains {id:'#(identifcador)'}

      Examples:
        |nombre|cantidad|precio|
        |Silla|99|7.99|
        |Taburete|88|7.99|
