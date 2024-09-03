@sad
Feature: Al Actualizar verificar los escenarios Sad Path
	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
    * def sku_generico = 'aaaaaaaa-bbbb'
    * header Accept = 'application/json'
      
	Scenario Outline: El metodo PUT valida el mensaje de error predeterminado
    Given path ruta_crear,"/",sku_generico,"/"
    And request <producto>
    When method put
    Then match $ == {"sku": '#string', "status": '#boolean',"message": <mensaje>}
     Examples:
	| producto   | mensaje |
	| { name: '', description: 'Telefono', price: 100 } | 'El producto no fue encontrado' |
	
	Scenario: El metodo PUT valida un código de error
		Given path ruta_crear,"/",sku_generico,"/"
    And request { name: '', description: 'Telefono', price: 100 }
    When method put
    Then status 400
    
  Scenario: El metodo PUT valida Schema
  	Given path ruta_crear,"/",sku_generico,"/"
 		And request { name: '', description: 'Telefono', price: 100 }
    When method put
    And match responseType == 'json'
    And match $ == {"sku": '#string', "status": '#boolean',"message": '#string'} 
