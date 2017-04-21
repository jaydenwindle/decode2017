class AppProxyController < ApplicationController
   include ShopifyApp::AppProxyVerification

  def index
    render layout: false, content_type: 'application/liquid'
  end

  def enter
      @giveaway = Giveaway.find_by_id(params[:id])

      return unless @giveaway # TODO: check to make sure giveaway belongs to current store

      render layout: false, content_type: 'application/liquid'
  end

  def confirmation 
      render layout: false, content_type: 'application/liquid'
  end

end
