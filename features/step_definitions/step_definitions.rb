Given /^I am on the home page$/ do
  visit root_path
end

Given /^I open the (.*) page$/ do |page_name|
  click_link page_name
end

Given /^I should see "(.*)"$/ do |content|
  expect(page).to have_content content
end

Given /^I should see a search box$/ do
  expect(page).to have_css "input#pmid"
end

Given /^I should see a submit button$/ do
  expect(page).to have_button "Blossom"
end
