class FlowersController < ApplicationController
  def flower
    if params[:pmid]
      begin
        @citation = PubMedApps::Citation.new params[:pmid]
        @related_citations = @citation.related_citations
      rescue ArgumentError => e
        @arg_error = "The PMID is invalid"
      end
    end
  end
end
