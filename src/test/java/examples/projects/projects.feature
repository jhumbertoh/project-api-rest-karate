Feature: sample karate projects redmine test script

  Background:
    * url 'http://localhost:8081'

  Scenario Outline: Creacion de un Proyecto en redmine
    * def numberRandom = function() {return (Math.floor(Math.random() * (900000) ) + 100000).toString()}
    * def numberRandom = 'redmineproject'+ numberRandom()

    Given path 'projects.json'
    And header X-Redmine-API-Key = 'f04abfe57d3828d1a53df2db5699e2d108680e0b'
    And request read('project.json')
    When method post
    Then status 201
    And match response.project.name == '<name>'

    Examples:
      | read('projects.csv') |