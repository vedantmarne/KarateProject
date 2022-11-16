Feature: Config demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Config demo 1
    Given print name

  #Simple GET request
  Scenario: GET Demo 1
    Given path '/api/users?page=2'
    When method GET
    Then status 200
    And print response
