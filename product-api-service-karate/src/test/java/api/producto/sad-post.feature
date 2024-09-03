@sad
Feature: Al Crear verificar los escenarios Sad Path
	Background:
    * url 'http://localhost:8081/api/v1/product/'
		* header Accept = 'application/json'
    * header Authorization = 'Bearer aGFzaGRzZnNkZnNkZnNkZnNk'
      
	Scenario Outline: El metodo POST valida el mensaje de error predeterminado
		Given request <producto>
    When method post
    Then match $ == {"sku": '#string', "status": '#boolean',"message": <mensaje>} 
    Examples:
	| producto   | mensaje |
	| { name: '', description: 'Telefono', price: 100 } | 'El nombre del producto no fue proporcionado' |
	| { name: 'Telefono', description: '', price: 100 } | 'La descripción del producto no fue proporcionada' |
	| { name: 'Telefono', description: 'Alta Gama', price: '' } | 'El precio del producto no fue proporcionado' |
	
	Scenario: El metodo POST valida un código de error
    Given request { name: '', description: 'Telefono', price: 100 }
    When method post
    Then status 400
    
  Scenario: El metodo POST valida Schema
 		Given request { name: '', description: 'Telefono', price: 100 }
    When method post
    And match responseType == 'json'
    And match $ == {"sku": '#string', "status": '#boolean',"message": '#string'} 