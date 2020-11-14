Feature: sample karate issues redmine test script

  Background:
    * url 'http://localhost:8081'


  Scenario: Get issues by list - JSON
    Given path 'issues.json'
    When method get
    Then status 200
    And match response.issues == '##[_ > 0]'

  Scenario: Get issues by id - JSON
    Given path 'issues/2.json'
    When method get
    Then status 200
    #Shema validation: https://github.com/intuit/karate#schema-validation
    And match response.issue.subject == '#string'

    And match response.issue.subject == 'I cannot create a user xml.'
    And match response.issue.description == 'As an admin user, I cannot create an user when xml...'


  Scenario: Crear un nuevo IssueJson y eliminarlo

    * def bodyIssue =
     """
     {
        "issue": {
          "project_id": 1,
          "subject": "Mi issue creado desde Karate DSL",
          "priority_id": 1
        }
     }
     """
    Given path 'issues.json'
    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
    And request bodyIssue
    When method post
    Then status 201

    * def id = response.issue.id
    * print 'Issue created id is: ', id

    Given path 'issues/' +id+ '.json'
    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
    When method delete
    Then status 204


  Scenario: Crear un nuevo IssueJson y actualizarlo

    * def bodyIssue =
     """
     {
        "issue": {
          "project_id": 1,
          "subject": "Mi issue creado desde Karate DSL",
          "priority_id": 1
        }
     }
     """
    Given path 'issues.json'
    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
    And request bodyIssue
    When method post
    Then status 201

    * def id = response.issue.id
    * print 'Issue created id is: ', id

    Given path 'issues/' +id+ '.json'
    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
    And request
    """
    {
        "issue": {
          "subject": "Mi issue modificado desde Karate DSL",
          "priority_id": 5,
          "notes": "El subject fue modificado..."
        }
     }
    """
    When method put
    Then status 204





