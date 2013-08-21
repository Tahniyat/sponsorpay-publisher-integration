# Communication with SponsorPay API will be done by this class.
# Documentation of SponsorPay API integration is located at /doc

class SponsorpayHandler
	include HTTParty

	base_uri API_BASE_URI
	attr_accessor :request_params, :result

	def initialize(params = {})
	  @request_params = default.merge(params)
	end

	def fetch_offers
	  format_request			# construct query params as per sponsorPay API requirements.
	  @result = {error: [], offers: []}
	  response = self.class.get '/offers.json', :query => @request_params
	  parse_response(response.body) unless !is_signed_response(response)
	  return @result
	end

	def format_request
	  tmp = @request_params.sort_by { |k, v| k.to_s }		# Order all request alphabetically
	  query_string = tmp.collect { |k, v| "#{k}=#{v}"}.join('&')	# Concatenate all request parameters
	  query_string = query_string + '&' + API_KEY			# Concatenate resulting string with your API key
	  hash = Digest::SHA1.hexdigest query_string			# Hash the resulting string using SHA1
	  @request_params.merge!({hashkey: hash})
	end

	def parse_response(response)
	  res = JSON.parse(response)
	  offers = []
	  error = {}
	  if res['code'] == 'OK'
	    res['offers'].each do |offer|
	      offers << Offer.new(offer.slice('title', 'payout', 'thumbnail'))
	    end
	  else
	    error[:code] = res['code']
	    error[:message] = res['message']
	  end
	  @result[:error] = error
	  @result[:offers] = offers
	end

	# For real time application, we'll get these fields from model.
	def default
	  {
	    appid: 157,
	    device_id: '2b6f0cc904d137be2 e1730235f5664094b 831186',
	    locale: 'de',
	    ip: '109.235.143.113',
	    offer_types: 112,
	    timestamp: Time.now.to_i,
	    format: FORMAT
	  }
	end

	# ensure the integrity and validity of the response
	def is_signed_response(response)
	  str = response.body + API_KEY
	  hash = Digest::SHA1.hexdigest str
	  if hash == response.header['X-Sponsorpay-Response-Signature']
  	    true
	  else
	    @result[:error] = {code: "Invalid response"
			       message: "Response generated from unauthorized source. "}
	    false
	  end
	end

end
