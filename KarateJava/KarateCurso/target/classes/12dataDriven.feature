Feature: use of data driven

	Background:
		* url 'http://localhost:8082'
		
	Scenario Outline: Create a product by data driven
		Given path '/mercado'
		And request {nombre:<nombre>, cantidad:<cantidad>, precio:<precio>}
		When method POST
		Then status 200
		And match response == {id:'#number', nombre:"#string", cantidad:"#number", precio:7.99}
		* def identificador = response.id
		
		# get by id
		Given path '/mercado', identificador
		When method GET
		Then status 200
		And match response contains {id: '#(identificador)'}	
		
		Examples:
		|nombre|cantidad|precio|
		|Silla|99|7.99|
		|Taburete|88|7.99|