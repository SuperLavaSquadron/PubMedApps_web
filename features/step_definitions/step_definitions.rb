When /^I am on the (.*) page$/ do |page_name|

  page_elems = page_name.split(" ").map { |s| s.downcase }

  if page_elems.count > 1
    visit page_elems.join "/"
  else
    if page_name.match /home/i
      visit root_path
    else
      visit "/#{page_name}".downcase
    end
  end
end

When /^I open the (.*) page$/ do |page_name|
  page_elems = page_name.split(" ").map { |s| s.downcase }
  
  if page_elems.count > 1
    visit page_elems.join "/"
  else
    click_link page_name
  end
end

When /^I click the "(.*)" link$/ do |link_name|
  click_link link_name
end

When /^I should ?(.*) see "(.*)"$/ do |negate, content|
  if negate == "not"
    expect(page).not_to have_content content
  elsif negate.empty?
    expect(page).to have_content content
  else
    abort("ERROR: malfored scenario step")
  end
end

When /^I should see a "(.*)" input box$/ do |field_name|
  expect(page).to have_field field_name.downcase
end

When /^I should see a "(.*)" button$/ do |button_name|
  expect(page).to have_button button_name
end

When /^I see a "(.*)" link to "(.*)"$/ do |link_name, path|
  expect(page).to have_link link_name, href: path
end

When /^I have not yet submitted a (.*)/ do |item|
end

When /^I submit an? ?(.*) PMID$/ do |kind|
  if kind == "invalid"
    fill_in "pmid", :with => "fahehe23"
  elsif kind.empty?
    fill_in "pmid", :with => "15"
  else
    abort("ERROR: malfored scenario step")
  end

  click_button "Blossom"
end

When /^I should ?(.*) see the query citation$/ do |negate|
  if negate == "not"
    expect(page).not_to have_css ".query"
  elsif negate.empty?
    expect(page).to have_css ".query"
  else
    abort("ERROR: malfored scenario step")
  end
end

When /^I should see related citations$/ do
  expect(page).to have_css ".related"
end

When /^I should ?(.*) see the query node$/ do |negate|
  page.all(:css, '.related')
  if negate == "not"
    expect(page).not_to have_css ".query"
  elsif negate.empty?
    expect(page).to have_css ".query"
  else
    abort("ERROR: malfored scenario step")
  end
end

When /^I should ?(.*) see related citation nodes$/ do |negate|
  if negate == "not"
    expect(page).not_to have_css ".node.related"
  elsif negate.empty?
    expect(page).to have_css ".node.related"
  else
    abort("ERROR: malfored scenario step")
  end
end

