Feature: To verify all the GET service API

  Background:

    * url apiBaseURL
    * header Content-Type = contenttype
    * def myVar = '{ "title": "foo", "body": "bar", "userId": 1}'
    * json requestbody = read('classpath:reflektion/api/request.json')

  Scenario: To verify the GET service API is returning 200 response

    Given path apiPathURL
    When method GET
    # Asserting the status is 200
    Then status 200

    # Asserting the schema
    * match each response[*].id == '#number'
    * match each response[*].title == '#string'
    * match each response[*].title == '#string'
    * match each response[*].body == '#string'
    * match each response[*].userId == '#number'

    # Asserting the records length
    * def len = response.length
    * match len == 100


  Scenario: To verify the GET service API is returning 200 response for a single record
    Given path apiPathURL + '/1'
    When method GET

    # Asserting the status is 200
    Then status 200
    Then print response

    # Asserting the schema
    * match each response[*].id == '#number'
    * match each response[*].title == '#string'
    * match each response[*].title == '#string'
    * match each response[*].body == '#string'
    * match each response[*].userId == '#number'

    # Asserting the records length
    * def id = response.id
    * match id == 1

  Scenario: To verify the GET service API is returning 404 for invalid request URL
    Given path invalidapiPathUrl
    When method GET

    # Asserting the status is 404
    Then status 404

    # Printing complete request and response for troubleshooting
    * print apiBaseURL + invalidapiPathUrl
    * print response

  Scenario: To verify the POST service API is returning 201 for a String request
    # Creating a post request
    Given path apiPathURL
    And request myVar
    When method POST

    # Asserting the status is 201
    Then status 201

    # validating the record created
    * print 'Record created is: ' + response.id

  Scenario: To verify the POST service API is returning 200 for a String request
    # Creating a post request
    Given path apiPathURL + '/1'
    And request requestbody
    When method PUT
     # Asserting the status is 201
    Then status 200
    * print response
    # validating the resposne
    * match response.id == 1
    * match response.title == 'abc'
    * match response.body == 'xyz'
    * match response.userId == 1

  Scenario: To verify the DELETE service API is returning 200
    Given path apiPathURL + '/1'
    When method DELETE

    # Asserting the status is 200
    Then status 200

    # Asserting the response
    * match response == {}











