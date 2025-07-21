Feature: Navigate to store

  Background:
    * url 'https://fakestoreapi.com'

  Scenario: add products
    * def product = read('add_product_store.json')
    Given path '/products'
    And request product
    When method post
    Then status 200
