class HomeController < ApplicationController

  # GET /
  def index
  end

  # POST /offers
  # Params: query: {uid: 'player1', pub0: 'campaign2', page: '2'}
  def offers
    query = params[:query]
    client = SponsorpayHandler.new(query)
    @result = client.fetch_offers
  end

end
