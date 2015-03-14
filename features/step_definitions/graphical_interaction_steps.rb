When /^I see the Flower$/ do
  expect(page).to have_css ".node.query"
  @original_query_id = find(".node.query")[:id]
  sleep(5.0)
end

When /^I hover my mouse over the (.*) node$/ do |kind|
  @node = find("." << kind)
  @node.trigger(:mouseenter)
end

Then /^I should see the tooltip$/ do
  tooltip = find("#toolgroup")
  expect(tooltip).to_not have_css ".hidden"
end

Then /^I should see the articles contents$/ do
  tooltext = find("#tooltext")
  pmid = @node[:id].split("_")[1]
  expect(tooltext.text).to have_content pmid
end

When /^I click the (.*) node$/ do |kind|
  @node = first("." << kind)
  @node.trigger(:mouseenter).click
end

Then /^I should be redirected to a new flower page$/ do
  new_query_id = find(".query")[:id]
  expect(@original_query_id).to_not eq(new_query_id)
end
