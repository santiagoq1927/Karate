Feature: management user in Reqres

  Background:
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    * url baseUrl

  Scenario: get all user
    * def page = 1
    Given path 'users'
    When method get
    Then status 200
    And match response.page == page

  Scenario: get user for id
    * def id = 2
    Given path 'users', id
    When method get
    Then status 200
    And match response.data.id == id

  Scenario Outline: add user
    * def bodyCreateUser = read('classpath:request/bodyAddUser.json')
    * def responseCreateUser = read('classpath:response/responseCreateUser.json')
    * bodyCreateUser.email = <email>
    * bodyCreateUser.first_name = <first_name>
    * bodyCreateUser.last_name = <last_name>
    Given path 'users'
    And request bodyCreateUser
    When method post
    Then status 201
    And match response == responseCreateUser
    Examples:
    |email                  |first_name   |last_name  |
    |'david@correo.com'     |'David'      |'Perez'    |
    |'santiago@correo.com'  |'Santiago'   |'Quijano'  |
    |'daniela@correo.com'   |'Daniela'    |'Velasco'  |

  Scenario: update user
    * def bodyUpdateUser = read('classpath:request/bodyUser.json')
    * def id = 3
    Given path 'users', id
    And request bodyUpdateUser
    When method put
    Then status 200
    And match response.email == bodyUpdateUser.email
    And match response.first_name == bodyUpdateUser.first_name
    And match response.last_name == bodyUpdateUser.last_name

  Scenario: delete user
    * def id = 4
    Given path 'users', id
    When method delete
    Then status 204