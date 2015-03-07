require 'rails_helper'
include ApplicationHelper

describe "pages" do

  subject { page }
  
  shared_examples_for "all pages" do
    it { should have_title full_title page_title }
  end

  describe "pages/home.html.slim" do
    before { visit root_path }
    let(:page_title) { "" }
    
    it_should_behave_like "all pages"
    it { should_not have_title "| PubMedApps" }
  end

  describe "flowers/flower.html.slim" do
    before { visit flower_path }
    let(:page_title) { "Flower" }

    it_should_behave_like "all pages"
  end

  describe "flowers/text.html.slim" do
    before { visit flower_text_path }
    let(:page_title) { "Flower (text only)" }

    it_should_behave_like "all pages"
  end
  
end
