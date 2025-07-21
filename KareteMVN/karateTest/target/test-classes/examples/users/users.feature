Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://reqres.in'

  Scenario: get all users
    Given path '/api/users?page=2'
    When method get
    Then status 200

  Scenario: create a user
    * def user_request =
    """
      {
      "name": "morpheus",
      "job": "leader"
      }
    """
    Given path '/api/users'
    And request user_request
    When method post
    Then status 201

    * def expectedName = user_request.name
    * def expectedJob = user_request.job

    And match response.name == expectedName
    And match response.job == expectedJob

