class FlowersController < ApplicationController
  respond_to :html, :js
  def flower
    if params[:pmid]
      begin
        @citation = PubMedApps::Citation.new params[:pmid]
        #@citation.related_citations
        #@citation.normalize
        @related_json = @citation.to_json
      rescue ArgumentError => e
        @arg_error = "The PMID is invalid"
      end
    end
  end

  def text
    if params[:pmid]
      begin
        @citation = PubMedApps::Citation.new params[:pmid]
        @citation.get_info # <= no test to confirm this line is here
        @related_citations = @citation.related_citations
      rescue ArgumentError => e
        @arg_error = "The PMID is invalid"
      end
    end
  end
end
