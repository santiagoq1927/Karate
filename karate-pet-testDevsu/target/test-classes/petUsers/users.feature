Feature: management user in PetStore

  Background:
    * url baseUrl

  Scenario Outline: add users
    * def bodyCreateUser = read('classpath:request/bodyAddUser.json').parameterData
    * def responseCreateUser = read('classpath:response/responseUser.json')
    * bodyCreateUser.id = <id>
    * bodyCreateUser.username = <username>
    * bodyCreateUser.firstName = <firstName>
    * bodyCreateUser.lastName = <lastName>
    * bodyCreateUser.email = <email>
    * bodyCreateUser.password = <password>
    * bodyCreateUser.phone = <phone>
    * bodyCreateUser.userStatus = <userStatus>
    Given path 'user'
    And request bodyCreateUser
    When method post
    Then status 200
    And match response == responseCreateUser
    Examples:
    |id   |username   |firstName  |lastName    |email                   |password     |phone        |userStatus |
    |1    |'juanp'    |'juan'     |'perez'     |'juanp@correo.com'      |'password1'  |'1234567890' |1          |
    |2    |'mateoc'   |'mateo'    |'castillo'  |'mateoc@correo.com'     |'password1'  |'9876543210' |2          |

  Scenario: e2e user
    #add user
    * def bodyCreateUser = read('classpath:request/bodyAddUser.json').dataWithValue
    * def responseUser = read('classpath:response/responseUser.json')
    Given path 'user'
    And request bodyCreateUser
    When method post
    Then status 200
    And match response == responseUser
    * def usernameCreated = bodyCreateUser.username
    #search user for username
    Given path 'user', usernameCreated
    When method get
    Then status 200
    And match response.username == usernameCreated
    #update user
    * def fistNameUpdate = 'david'
    * def emailUpdate = 'davidq@correo.com'
    * set bodyCreateUser.firstName = fistNameUpdate
    * set bodyCreateUser.email = emailUpdate
    Given path 'user', usernameCreated
    And request bodyCreateUser
    When method put
    Then status 200
    And match response == responseUser
    #search user update
    Given path 'user', usernameCreated
    When method get
    Then status 200
    And match response.firstName == fistNameUpdate
    And match response.email == emailUpdate
    #delete user
    Given path 'user', usernameCreated
    When method delete
    Then status 200