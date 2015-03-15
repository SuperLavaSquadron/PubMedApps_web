When /^I am on the (.*) page$/ do |page_name|
  page_elems = page_name.split(" ").map { |s| s.downcase }
  
  if page_elems.count > 1
    visit "/"+ page_elems.join("/")
  else
    if page_name.match /home/i
      visit root_path
    else
      #visit page_name.downcase.to_sym # original [BROKEN]
      #visit (page_name + "_path").to_sym # [BROKEN]

      #visit "/"+page_name.downcase # Prefix with the "/"
      visit ("/"+page_name.downcase).to_sym
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
    fill_in "pmid", with: "fahehe23"
  elsif kind.empty?
    fill_in "pmid", with: "15"
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

# researcher_hovers_over_node.feature

When /^I see the PubMed Flower$/ do
  visit flower_path
  fill_in "pmid", with: "15"
  click_button "Blossom"
end

When /^I should see the query node's info$/ do
  @query = find "circle.query"
  have_node_info @query
end

When /^I hover my mouse over a node$/ do
  # the find method will randomly fail, this is the same problem as
  # the bug I put on trello
  @node = find "circle.related:last-child"
  @node.trigger :mouseover
end

When /^I move my mouse out of the node$/ do
  @node.trigger :mouseout
end

When /^I should see that node's info$/ do
  have_node_info @node
end

# When /^I should not see that node's info$/ do
#   not_have_node_info @node
# end
  
def have_node_info node
  expect(page).to have_content node["pmid"]  
  expect(page).to have_content node["title"]
  expect(page).to have_content node["abstract"]  
end  

def not_have_node_info node
  # technically it still has it, it's just white so you cant see it
end  
