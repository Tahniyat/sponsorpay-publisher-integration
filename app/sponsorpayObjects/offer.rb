class Offer
  attr_accessor :title, :thumbnail, :payout

  def initialize(params)
    params.each do |key, value|
	instance_variable_set("@#{key}", value) unless value.nil?		# this can be achieved by self.send as well.
    end
  end

end
