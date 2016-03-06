class FlowersController < ApplicationController
  respond_to :html, :js
  def flower
    if params[:pmid]
      begin
        @citation = PubMedApps::Citation.new params[:pmid]
        @related_json = @citation.to_json
      rescue ArgumentError => e
        @arg_error = "The PMID is invalid"
      end
    end
    if request.xhr?
      render json: @related_json
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
