Feature: Management pets

  Background:
    * url baseUrl
  @create_pet
  Scenario: Create a new dog
    And path 'pets'
    And request {"name": "Ringo","type": "Dog","age": 1}
    When method post
    Then status 201
    And match response.message contains "created"
    * def petId = response.data.id

  @search_pet
  Scenario: search a pet
    * def createPetResult = call read('pets.feature@create_pet')
    * def petId = createPetResult.petId
    When url baseUrl
    And path 'pets', petId
    And method get
    Then status 200

  @update_pet
  Scenario: update a pet
    * def createPetResult = call read('pets.feature@create_pet')
    * def petId = createPetResult.petId
    When url baseUrl
    And path 'pets', petId
    And request {"name": "Ringo","type": "Cat","age": 10}
    And method put
    And status 200
    And match response.data.type == "Cat"
    And match response.data.age == 10

  Scenario: partial update a pet
    * def createPetResult = call read('pets.feature@create_pet')
    * def petId = createPetResult.petId
    When url baseUrl
    And path 'pets', petId
    And request {"type": "Fish"}
    And method patch
    And status 200
    And match response.data.type == "Fish"

  @delete_pet
  Scenario: Delete a pet
    * def createPetResult = call read('pets.feature@create_pet')
    * def petId = createPetResult.petId
    When url baseUrl
    And path 'pets', petId
    And method delete
    And status 204
    Then url "http://localhost:3000/pets/" + petId
    And method get
    And status 404

  Scenario Outline: Create a new pet
    Given path 'pets'
    And request {"name": "<name>","type": "<type>","age": <age>}
    When method post
    Then status 201
    And match response == {"status": "success","message": "Pet created","data": {"id": #number,"name": #string,"type": #string,"age": #number}}
    And match response.message contains "created"
    Examples:
    |name |type |age|
    |bruno|dog  |1  |
    |max  |cat  |2  |
    |rick |horse|3  |

  Scenario Outline: Create a new dog with read external information
    * def bodyCreatePet = read('classpath:request/bodyCreatePet.json')
    * def responseCreatePet = read('classpath:response/responseCreatePet.json')
    * bodyCreatePet.name = "<name>"
    * bodyCreatePet.type = "<type>"
    * bodyCreatePet.age = <age>
    Given path 'pets'
    And request bodyCreatePet
    When method post
    Then status 201
    And match response == responseCreatePet
    And match response.message contains "created"
    Examples:
      |name |type |age|
      |bruno|dog  |1  |
      |max  |cat  |2  |
      |rick |horse|3  |

  Scenario: E2E
    #Create pet
    Given path 'pets'
    And request {"name": "Ringo","type": "Dog","age": 1}
    When method post
    Then status 201
    And match response.message contains "created"
    * def petId = response.data.id

    #Update pet
    When url baseUrl
    And path 'pets', petId
    And request {"name": "Ringo","type": "Cat","age": 10}
    And method put
    And status 200
    And match response.data.type == "Cat"
    And match response.data.age == 10

    #Search pet
    When url baseUrl
    And path 'pets', petId
    And method get
    Then status 200

    #Delete pet
    When url baseUrl
    And path 'pets', petId
    And method delete
    And status 204
    Then url baseUrl
    And path 'pets', petId
    And method get
    And status 404


