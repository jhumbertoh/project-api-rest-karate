Feature: sample karate issues test script

  Background:
    * url 'http://localhost:8081'


  Scenario: Get issues by list - JSON
    Given path 'issues.json'
    When method get
    Then status 200

  Scenario: Get issues by id - JSON
    Given path 'issues/2.json'
    When method get
    Then status 200
    And match response.issue.subject == 'I cannot create a user xml.'
    And match response.issue.description == 'As an admin user, I cannot create an user when xml...'



