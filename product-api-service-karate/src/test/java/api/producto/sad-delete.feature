@sad
Feature: Al Eliminar verificar los escenarios Sad Path
	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
    * def sku_generico = 'aaaaaaaa-bbbb'
      
	Scenario: El metodo DELETE obtiene un código de error
    Given path ruta_crear,"/",sku_generico,"/"
    And header Accept = 'application/json'
    When method delete
    Then status 404
    
  Scenario: El metodo DELETE valida el estado falso en el response
    Given path ruta_crear,"/",sku_generico,"/"
    And header Accept = 'application/json'
    When method delete
    Then match $ == {"count": '#number',"status":false, "message": "#string"} 
    
 Scenario: El metodo DELETE valida el mensaje de error predeterminado
    Given path ruta_crear,"/",sku_generico,"/"
    And header Accept = 'application/json'
    When method delete
    Then match $ == {"count": '#number', "status": '#boolean',"message":"El producto no fue encontrado"} 

 Scenario: El metodo DELETE valida Schema
 		Given path ruta_crear,"/",sku_generico,"/"
    And header Accept = 'application/json'
    When method delete
    And match responseType == 'json'
    And match $ == {"count": '#number', "status": '#boolean', "message": "#string"} 
 
