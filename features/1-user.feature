Feature: 1. Filter feature

  Scenario: Add filter
    Given I have opened create filter screen
    When I create filter "property_positive"
    Then I return to create filter screen
    When I create filter "transport_positive"
    Then I return to create filter screen
    When I create filter "vacancy_positive"
    Then I return to create filter screen
