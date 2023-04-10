Feature: Testing RESTful Booker API

  Background:
    * def auth = { username: 'admin', password: 'password123'}
    * def getToken = function(auth) { return karate.callSingle('tokens.feature', auth).token }
    * def token = getToken(auth)
    * configure headers = { Authorization: 'Bearer #{token}' }
    * url 'https://restful-booker.herokuapp.com'

  Scenario: Get all bookings
    Given path 'booking'
    When method get
    Then status 200

  Scenario: Create a new booking
    Given path 'booking'
    And request { "firstname": "John", "lastname": "Doe", "totalprice": 123, "depositpaid": true, "bookingdates": { "checkin": "2023-05-01", "checkout": "2023-05-10" }, "additionalneeds": "Breakfast" }
    When method post
    Then status 200
    And match response.firstname == 'John'
    And match response.lastname == 'Doe'

  Scenario: Update an existing booking
    Given path 'booking/1'
    And request { "firstname": "Jane", "lastname": "Doe", "totalprice": 456, "depositpaid": false, "bookingdates": { "checkin": "2023-06-01", "checkout": "2023-06-10" }, "additionalneeds": "Lunch" }
    When method put
    Then status 200
    And match response.firstname == 'Jane'
    And match response.lastname == 'Doe'
    And match response.totalprice == 456
    And match response.depositpaid == false

  Scenario: Delete a booking
    Given path 'booking/1'
    When method delete
    Then status 201