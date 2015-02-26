module PubMedApps
  class Citation
  end
end

When /^I am on the home page$/ do
  visit root_path
end

When /^I open the (.*) page$/ do |page_name|
  click_link page_name
end

When /^I should see "(.*)"$/ do |content|
  expect(page).to have_content content
end

When /^I should see a search box$/ do
  expect(page).to have_css "input#pmid"
end

When /^I should see a submit button$/ do
  expect(page).to have_button "Blossom"
end

When /^I have not yet submitted a PMID$/ do
  visit flower_path
  expect(page).to have_css "input#pmid", text: ""
end

When /^I submit a PMID$/ do
  fill_in "PMID", with: "15"
  click_button "Blossom"
end

When /^I submit a PMID that is invalid$/ do
  fill_in "PMID", with: "fahehe23"
  click_button "Blossom"
end

When /^I should see the query node$/ do
  expect(page).to have_css "svg > circle.query"
end

When /^I should not see the query node$/ do
  expect(page).not_to have_css "svg > circle.query"
end

When /^I should see related citation nodes$/ do
  expect(page).to have_css "svg > circle.related"
end

# When /^I should not see related citation nodes$/ do
#   expect(page).not_to have_css "svg > circle.related"
# end

