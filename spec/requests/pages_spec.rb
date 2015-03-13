require 'rails_helper'
include ApplicationHelper

describe "pages" do

  subject { page }

  shared_examples_for "all pages" do
    describe "title" do
      it { should have_title full_title page_title }
    end

    describe "nav bar" do
      it { should have_css "nav.top-bar > ul.title-area" }
      it { should have_css "nav.top-bar > section.top-bar-section > ul.right" }
      it { should have_link "PubMedApps", href: root_path }
      it { should have_link "Flower", href: flower_path }
      it { should have_link "Flower (text only)", href: flower_text_path }
    end
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
