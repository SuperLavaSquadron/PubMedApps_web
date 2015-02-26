Given /^I have not yet submitted a PMID$/ do
  visit flower_path
end

Given /^I have typed my PMID in the search box$/ do
  fill_in 'pmid', with: "12345"
end

Given /^PMID is valid$/ do
  pmid.match /[0-9]+/
end

Given /^PMID has related citations$/ do
  pending("implemented PMID related verification")
end

Given /^I click the (.*) button$/ do |button|
  click_button button
end

Then /^I should see the query node$/ do
  expect(page).to have_content ".node#query"
end

Then /^I should see the related citation nodes$/ do
  expect(page).to have_css ".node#12346"
end
