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

When /^I should see the query node$/ do
  expect(page).to have_css "svg > circle"
end

When /^I should not see the query node$/ do
  expect(page).not_to have_css "svg > circle"
end

@todo
When /^I should see the related citation nodes$/ do
  # should i have 5 expectations in one example? This would be bad
  # RSpec form, not sure if it is okay here
  (1..5).each do |pmid|
    expect(page).to have_css "svg > circle##{pmid}"
  end
end
