Feature: Generate Token for Restful Booker API

  Background:
    * url 'https://restful-booker.herokuapp.com/auth'

  Scenario: Generate token with valid credentials
    Given request { "username": "admin", "password": "password123" }
    When method post
    Then status 200
    And match response.token != null