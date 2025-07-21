Feature: Check returned users by API

  Background:
    * url 'https://reqres.in/'
    * header Accept = 'application/json'
    * def sleep =
		"""
		function(seconds){
			for(i=0; i<=seconds; i++){
				java.lang.Thread.sleep(1000);
			}
		}
		"""
  Scenario: Use $
    Given path 'api/users'
    And param id = 2
    When method GET
    Then status 200
    And match $.data contains {id:2}
    And call sleep 10

  Scenario: Call get test user with id 2
    Given path 'api/users/2'
    When method GET
    Then status 200
    Then print response
    And match response == {"data": {"id": 2,"email": "janet.weaver@reqres.in","first_name": "Janet","last_name": "Weaver","avatar": "https://reqres.in/img/faces/2-image.jpg"},"support": {"url": "https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral","text": "Tired of writing endless social media content? Let Content Caddy generate it for you."}}