# SponsorPay Challenge #

##Intro - Problem Statement##

1. Create a form asking for the params (uid, pub0 and page)
2. Make the request to the API passing the params and the authentication hash 
3. Get the result from the response.
4. Check the returned hash to check that it’s a real response (check signature) 
5. Render the offers in a view (ERB or HAML)  
    a. If we have offers there we render them (title, thumbnail lowres and payout)  
    b. If we have no offers there we render a message like ‘No offers’
6. Create functional and unit tests (choose your tool: TestUnit, RSpec, Shoulda...)

##Solution##

###Setup###
- git clone this project
- `bundle install`
- `rails s` to start server
- `rake test` to run test cases

###Description###
**config/initializer/constants.rb:** Contains all global constants  
**app/sponsorpay/sponsorpay_handler.rb:** SponsorPay API client implementation  
**app/sponsorpayObjects/offer.rb:** SponsorPay Offer class  
**app/views/home:** HAML is used for HTML views  
**test/functional:** Contains functional test cases  

