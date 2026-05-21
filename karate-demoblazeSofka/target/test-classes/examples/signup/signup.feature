Feature: Signup in demo blaze   

    Background:
        * url baseUrl

    Scenario: Signup with new user
        * def bodyUser = read('classpath:request/bodyNewUser.json')
        * def username = 'user_' + java.lang.System.currentTimeMillis()
        * bodyUser.username = username
        * bodyUser.password = "123456"
        Given path 'signup'
        And request bodyUser
        When method post
        Then status 200
        And match response contains '""'

    Scenario Outline: Signup with existing user
        * def bodyUser = read('classpath:request/bodyUserExisting.json')
        * def responseUser = read('classpath:response/responseUserExisting.json')
        * bodyUser.username = <username>
        * bodyUser.password = <password>
        Given path 'signup'
        And request bodyUser
        When method post
        Then status 200
        And match response == responseUser
        Examples:
        |username |password   |
        |"user"   |"password" |
        |"test"   |"123456"   |