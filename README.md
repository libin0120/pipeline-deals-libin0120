# pipeline-deals-libin0120

* A public server is deployed at Heroku for easy access to review:

  https://pipeline-deals-libin0120.herokuapp.com/


* Notes: 
  * To run server `rails server`
  * To show the chart access `http://localhost:3000/` or `http://localhost:3000/deals`
  * It is a pure server side application. Chart page is rendered on server side.  
  * Can handle multiple pages return if encountering large data set
  * Can handle invalid authentication properly
  * I added JSON API support. So there could be another SPA call this backend, and draw the chart on client side. To access the API: `http://localhost:3000/deals.json` 
  

* Ruby version

  2.3.1

* System dependencies
  
  Ruby

* Configuration

  run `gem install bundler` 
  run `bundle install1`

* Database creation

  No Need
  
* Database initialization

  No Need
  
* How to run the test suite

  run `rails test`
    
* Deployment instructions


