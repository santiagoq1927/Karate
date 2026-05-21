Feature: Login in demo blaze

  Background:
    * url baseUrl

  Scenario: Login successful
    * def bodyUser = read('classpath:request/bodyLoginSuccess.json')
    * bodyUser.username = 'adriandiaz'
    * bodyUser.password = '123456'
    Given path 'login'
    And request bodyUser
    When method post
    Then status 200
    And match response contains 'Auth_token'

  Scenario Outline: Incorrect login
    * def bodyUser = read('classpath:request/bodyIncorrectLogin.json')
    * def responseUser = read('classpath:response/responseIncorrectLogin.json')
    * bodyUser.username = <username>
    * bodyUser.password = <password>
    Given path 'login'
    And request bodyUser
    When method post
    Then status 200
    And match response == responseUser
    Examples:
      |username     |password        |
      |"userTest"   |"passwordWrong" |
      |"testUser"   |"wrongPassword" |