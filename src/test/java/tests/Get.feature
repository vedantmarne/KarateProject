Feature: GET API Demo

  Background: 
    * url 'https://reqres.in'
    * header Accept = 'application/json'

  #Simple GET Request
  Scenario: GET Demo 1
    When method GET
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #GET with Background
  Scenario: GET Demo 2
    Given path '/api/users?page=2'
    When method GET
    Then status 200
    And print response

  #GET with Path,Params
  Scenario: GET Demo 3
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  #GET with Assertions
  Scenario: GET Demo 4
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match response.data[3].id == 10
    And match response.data[4].last_name == 'Edwards'
