Feature: Check returned users by API

	Background:
		* url 'https://reqres.in/'
		* header Accept = 'application/json'
		* def featureParent = read('06featureParent.feature')
		* def resultParent = call featureParent
		
	Scenario: Call get test array with json
		Given path 'api/users/2'
		When method GET
		Then status 200
		And match response == resultParent.expectedArrayOutput[0]