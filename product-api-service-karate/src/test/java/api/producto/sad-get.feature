@sad
Feature: Al Listar productos verificar los escenarios Sad Path
	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
    * header Accept = 'application/json'

      
	Scenario: El metodo GET valida el mensaje de error predeterminado
    Given path ruta_crear,"/"
    When method get
    Then status 200
    And match $ == {"products": '#array', "status": '#boolean',"message": 'Se encontró 0 producto(s)'} 

  Scenario: El metodo GET valida Schema
  	Given path ruta_crear,"/"
    When method get
    Then status 200
    And match $ == {"products": '#array', "status": '#boolean',"message": '#string'}
    
    