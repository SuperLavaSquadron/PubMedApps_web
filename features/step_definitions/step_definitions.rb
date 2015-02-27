When /^I am on the (.*) page$/ do |page|
  if page.match /home/i
    visit root_path
  else
    visit page.downcase.to_sym
  end
end

When /^I open the (.*) page$/ do |page_name|
  click_link page_name
end

When /^I should see "(.*)"$/ do |content|
  expect(page).to have_content content
end

When /^I should see a "(.*)" input box$/ do |field_name|
  expect(page).to have_field field_name.downcase
end

When /^I should see a "(.*)" button$/ do |button_name|
  expect(page).to have_button button_name
end

When /^I have not yet submitted a (.*)/ do |item|
end

When /^I submit an? ?(.*) PMID$/ do |kind|
  if kind == "invalid"
    fill_in "pmid", with: "fahehe23"
  elsif kind.empty?
    fill_in "pmid", with: "15"
  else
    abort("ERROR: malfored scenario step")
  end

  click_button "Blossom"
end

When /^I should ?(.*) see the query node$/ do |negate|
  if negate == "not"
    expect(page).not_to have_css "svg > circle.query"
  elsif negate.empty?
    expect(page).to have_css "svg > circle.query"
  else
    abort("ERROR: malfored scenario step")
  end
end

When /^I should ?(.*) see related citation nodes$/ do |negate|
  if negate == "not"
    expect(page).not_to have_css "svg > circle.related"
  elsif negate.empty?
    expect(page).to have_css "svg > circle.related"
  else
    abort("ERROR: malfored scenario step")
  end
end
