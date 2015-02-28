require 'rails_helper'

RSpec.configure do |config|
  config.before :each do
    @pmid = "15"
    @abstract = "I'm the abstract."
    @title = "Fahehe the Wise, the Powerful"
    @related_pmid = "150"
    @related_abstract = "I'm the related abstract."
    @related_title = "The Tale of Fahehe"
    @related_score = "1.0"

    citation =
      new_citation pmid: @pmid, abstract: @abstract, title: @title
    
    related =
      new_citation(pmid: @related_pmid,
                   abstract: @related_abstract,
                   title: @related_title,
                   score: @related_score)

    assign :citation, citation
    assign :related_citations, [related]

    render
  end

  config.before(:example, :abstract => :none) do
    citation = PubMedApps::Citation.new "15"
    assign :citation, citation
    assign :related_citations, []
    render
  end
end

RSpec.describe "flowers/text.html.slim", :type => :view do
  context "the query citation has related citations" do
    it "shows the query citation's title" do
      expect(rendered).to have_css ".query", text: @title
    end

    context "when query has abstract" do
      it "shows the query citation's abstract" do
        expect(rendered).to have_css ".query", text: @abstract
      end
    end

    context "when query doesn't have abstract" do
      it "shows that no abstract is available", :abstract => :none do
        expect(rendered).to have_css ".query", text: "Not available"
      end
    end

    it "shows the related citations' title(s)" do
      link = "/flower/text?pmid=#{@related_pmid}"
      expect(rendered).to have_link @related_title, href: link
    end

    it "shows the related citations' abstract(s)" do
      expect(rendered).to have_css ".related", text:  @related_abstract
    end

    it "shows the related citations' score(s)" do
      expect(rendered).to have_css ".related", text: @related_score
    end
  end
end

def new_citation pmid:, abstract:, title:, score: 0
  citation = PubMedApps::Citation.new pmid
  citation.abstract = abstract
  citation.pmid = pmid
  citation.title = title
  citation.score = score

  citation
end
