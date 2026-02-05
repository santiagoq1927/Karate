Feature: Get post

  Background:
    * url "https://jsonplaceholder.typicode.com/"
    * path "posts"

  Scenario: post
    When method get
    Then status 200