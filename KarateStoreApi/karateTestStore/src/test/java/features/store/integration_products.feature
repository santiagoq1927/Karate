Feature: Navigate to store

  Background:
    * url 'https://fakestoreapi.com'

  Scenario: add products
    * def product =
    """
      {
        "id": 0,
        "title": "Play 4",
        "price": 2000000,
        "description": "Video game console",
        "category": "Video games",
        "image": "http://example.com"
      }
    """
    Given path '/products'
    And request product
    When method post
    Then status 200

    * def productId = response.id
    * print 'product id', productId

    Given path '/products/', productId
    When method get
    Then status 200
    And response.id = productId

    * def productUpdate =
    """
    {
      "id": 0,
      "title": "Play 5",
      "price": 5000000,
      "description": "Video game console",
      "category": "Entertainment",
      "image": "http://example.com"
    }
    """
    Given path '/products/', productId
    And request productUpdate
    When method put
    Then status 200

    * def productUpdateTitle = productUpdate.title
    And match response.title == productUpdateTitle

    Given path '/products/', productId
    When method get
    Then status 200
    And response.id = productId

    Given path '/products/'
    When method get
    Then status 200