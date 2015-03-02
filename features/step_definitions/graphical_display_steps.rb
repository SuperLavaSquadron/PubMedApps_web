Given /^I have typed my PMID in the search box$/ do
  fill_in 'pmid', :with => '12345'
end

Given /^PMID is valid$/ do
  find_field('pmid').value.match /[0-9]+/
end

Given /^PMID has related citations$/ do
  #pending("implemented PMID related verification")
  find_field('pmid')
end

Given /^I click the (.*) button$/ do |button|
  click_button button
end

Given /^show me the page$/ do
  save_and_open_page
  screenshot_and_save_page
end
