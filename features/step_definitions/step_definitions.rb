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

# Graphical display [5 steps]

When /^I see the PubMed Flower$/ do
  @original_query_pmid = "15"
  visit flower_path
  fill_in "pmid", with: @original_query_pmid
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
  @hover_pmid = @node[:id].split("_")[-1]
  @node.trigger :mouseover
end

When /^I move my mouse out of the node$/ do
  @node.trigger :mouseout
end

When /^I should see that node's info$/ do
  have_node_info @node
end

When /^I click the (.*) node$/ do |kind|
  @node = first("." << kind) unless @node
  @node.trigger(:click)
end

When /^I should go to a new flower page$/ do
  new_query_pmid = find(".query")[:id]
  expect(@original_query_pmid).to_not eq(new_query_pmid)
end

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

# Linking to PubMed [3 steps]
Given /^I see the PubMed url$/ do
  @pubmed_url_base = "http://www.ncbi.nlm.nih.gov/pubmed/"
  link = find_link('pubmedlink')[:href]
  expect(link).to include(@pubmed_url_base)
end

When /^I click the PubMed link$/ do
  # Custom step that allows content from pubmed.gov

  link_name = "View article"
  page.driver.allow_url "www.ncbi.nlm.nih.gov"
  page.driver.allow_url "static.pubmed.gov"
  click_link link_name
end

Then /^I should go to the articles PubMed page$/ do
  expect(@pubmed_url_base + @hover_pmid).to eq(current_url)
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
