Feature: researcher submits PMID

  As a researcher
  I want to submit a PMID
  So that I can see related citations

  Scenario: before I submit a PMID
    Given I am on the Flower page
    And I have not yet submitted a PMID
    Then I should not see the query node

  Scenario: submit a PMID that has related citations
    Given I am on the Flower page
    When I submit a PMID
    Then I should see the query node
    And I should see related citation nodes

  Scenario: submit an invalid PMID (eg 'fahehe phage')
    Given I am on the Flower page
    When I submit an invalid PMID
    Then I should see "The PMID is invalid"
    But I should not see the query node
