Feature: POST API Demo

  Background: 
    * url 'https://reqres.in'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  #Simple POST request
  Scenario: POST Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

  #POST request with Background
  Scenario: POST Demo 2
    Given path '/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

  #POST request with assertion
  Scenario: POST Demo 3
    Given path '/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "morpheus","id": "#string","job": "leader"}
    And print response

  #POST request with read response from file
  Scenario: POST Demo 4
    Given path '/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  #POST request with read request body from file
  Scenario: POST Demo 5
    Given path '/api/users'
    And def requestBody = read('request1.json')
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  #Read body data from file and change request values
  Scenario: POST Demo 6
    Given path '/api/users'
    And def requestBody = read('request1.json')
    And set requestBody.job = 'engineer'
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response
