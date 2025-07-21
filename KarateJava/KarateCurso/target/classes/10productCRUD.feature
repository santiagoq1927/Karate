Feature: product endpoint

Background:
* url 'http://localhost:8082'

Scenario: CRUD product
Given path '/mercado'
And request {nombre:"Galletas", cantidad:23, precio:3.45}
When method POST
Then status 200
And match response == {id:'#number', nombre:"Galletas", cantidad:"#number", precio:3.45}

* def identificador = response.id

# get by id
Given path '/mercado', identificador
When method GET
Then status 200
And match response contains {id: '#(identificador)', nombre: "#string"}

# update
Given path '/mercado', identificador
And request {id: '#(identificador)', nombre:"Leche", cantidad:0, precio:0.45}
When method PUT
Then status 200
And match response contains {id: '#(identificador)', nombre: "Leche"}

# list
Given path '/mercado'
When method GET
Then status 200
And print "---- LISTA DE PRODUCTOS ----"
And print response

# delete with id
Given path '/mercado', identificador
When method DELETE
Then status 200

# delete with body
Given path '/mercado'
And request {id: '#(identificador)', nombre:"Leche", cantidad:0, precio:0.45}
When method DELETE
Then status 500

# list
Given path '/mercado'
When method GET
Then status 200
And print "---- LISTA DE PRODUCTOS ----"
And print response