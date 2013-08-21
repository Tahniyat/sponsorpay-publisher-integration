if Rails.env == "production"
  DOMAIN_URL = ''
  DOMAIN_NAME = 'sponsorpay-task-production'
  API_BASE_URI = ''
  API_KEY = ''
  FORMAT = 'json'
else
  DOMAIN_URL = 'http://localhost:3000'
  DOMAIN_NAME = 'sponsorpay-task-development'
  API_BASE_URI = 'http://api.sponsorpay.com/feed/v1/'
  API_KEY = 'b07a12df7d52e6c118e5d47d3f9e60135b109a1f'
  FORMAT = 'json'
end
