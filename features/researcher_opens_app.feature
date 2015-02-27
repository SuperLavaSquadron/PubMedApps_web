Feature: Researcher opens PubMed Flower app

  As a researcher
  I want to open the Flower app
  So I can have fun searching PubMed

  Scenario: open
    Given I am on the home page
    When I open the Flower page
    Then I should see "PubMed Flower"
    And I should see a "PMID" input box
    And I should see a "Blossom" button
