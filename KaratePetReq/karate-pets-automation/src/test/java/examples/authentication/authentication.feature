Feature: authentication app

  Background:
    * url baseUrl

  Scenario: Basic authentication
    * def credentials = "admin:password123"
    * def encoded = Java.type('java.util.Base64').encoder.encodeToString(credentials.getBytes())
    Given url baseUrl
    And path "protected-basic"
    And header authorization = 'Basic' + encoded
    When method get
    Then status 401

  Scenario: Bearer authorization
    Given url baseUrl
    And path "login"
    And request {"username": "automation"}
    When method post
    Then status 200
    And def accessToken = response.data.accessToken
    And path "protected-bearer"
    And header authorization = "Bearer " + accessToken
    And method get
    And status 200
