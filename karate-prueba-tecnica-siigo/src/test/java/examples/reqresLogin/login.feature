Feature: management user in Reqres

  Background:
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    * url baseUrl

  Scenario: Login user success
    * def bodyCredentials = read('classpath:request/credentialsUser.json')
    * bodyCredentials.email = "eve.holt@reqres.in"
    * bodyCredentials.password = "cityslicka"
    Given path 'login'
    And request bodyCredentials
    When method post
    Then status 200
    And match response.token == '#present'

  Scenario Outline: Login user no success
    * def bodyCredentials = read('classpath:request/credentialsUser.json')
    * bodyCredentials.email = <email>
    * bodyCredentials.password = <password>
    Given path 'login'
    And request bodyCredentials
    When method post
    Then status 400
    And match response.error == <messageError>
    Examples:
    |email                |password     |messageError                 |
    |''                   |'cityslicka' |'Missing email or username'  |
    |'eve.holt@reqres.in' |''           |'Missing password'           |