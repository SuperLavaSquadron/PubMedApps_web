Feature: researcher submits PMID (text only)

  As a researcher
  I want to submit a PMID
  So that I can see related citations

  Scenario: I navigate to the text only Flower page
    Given I am on the Flower page
    And I see a "Text version" link to "/flower/text"
    When I click the "Text version" link
    Then I should see "PubMed Flower (Text only)"
    

  Scenario: before I submit a PMID
    Given I am on the Flower text page
    And I have not yet submitted a PMID
    Then I should not see the query citation

    @javascript
   Scenario: submit a PMID that has related citations
     Given I am on the Flower page
     When I submit a PMID
     Then I should see the query citation
     And I should see related citations

  # Scenario: submit an invalid PMID (eg 'fahehe phage')
  #   Given I am on the Flower page
  #   When I submit an invalid PMID
  #   Then I should see "The PMID is invalid"
  #   But I should not see the query node
