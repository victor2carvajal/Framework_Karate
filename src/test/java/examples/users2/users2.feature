Feature: Create New User

  Background:
    * def baseUrl = 'https://reqres.in/api'

  Scenario: Create a new user
    Given url baseUrl
    And path 'users'
    And request { "name": "John Doe", "job": "Software Engineer" }
    When method post
    Then status 201
    And match response.name == 'John Doe'
    And match response.job == 'Software Engineer'