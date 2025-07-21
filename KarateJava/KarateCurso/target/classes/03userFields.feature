Feature: Check returned users by API

	Background:
		* url 'https://gorest.co.in'
		* header Accept = 'application/json'
		
	Scenario: get list of all users
		Given path '/public-api/users'
		When method GET
		Then status 200
		And print response
		
	# param envio de parametro	
	Scenario: get user with id 5816847 by param
		Given path '/public-api/users'
		And param id = '5816847' 
		When method GET
		Then status 200
		And print response
		And match $.data[0] contains {id:"#number",name:"#string",email:"#regex [A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",gender: "#notnull"}

		# #null // #notnull // #boolean // #number // #object // #array // #string // #regex // #uuid