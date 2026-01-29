Feature: E2E user in reqres

  Scenario: E2E user
    #login
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    * def bodyLogin = read('classpath:request/dataUserE2E.json').login
    Given url baseUrl
    And path 'login'
    And request bodyLogin
    When method post
    Then status 200
    And match response.token == '#present'

    #get users
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    * def page = 1
    Given url baseUrl
    And path 'users'
    When method get
    Then status 200
    And match response.page == page

    #add user
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    * def bodyAddUser = read('classpath:request/dataUserE2E.json').addUser
    Given url baseUrl
    And path 'users'
    And request bodyAddUser
    When method post
    Then status 201
    * def idUser = response.id

    #update user
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    * def bodyUpdateUser = read('classpath:request/dataUserE2E.json').updateUser
    Given url baseUrl
    And path 'users', idUser
    And request bodyUpdateUser
    When method put
    Then status 200
    And match response.email == bodyUpdateUser.email
    And match response.first_name == bodyUpdateUser.first_name
    And match response.last_name == bodyUpdateUser.last_name

    #delete user
    * def keyApi = keyAccess
    * header x-api-key = keyApi
    Given url baseUrl
    And path 'users', idUser
    When method delete
    Then status 204

