class FlowersController < ApplicationController
  def flower
    if params[:pmid]
      @pmid = params[:pmid]
      @related_citations = (1..5)      
    end
  end
end
