# Jungle

A mini e-commerce application built with Rails 4.2. Working with inherited code, Ruby, and ActiveRecord.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Sign up for a Stripe account
5. Put Stripe (test) keys into appropriate .env vars
6. Run `bin/rails s -b 0.0.0.0` to start the server
4. Go to <http://localhost:3000/> in your browser

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

!["Screenshot of homepage"](https://github.com/jenniferhsueh/jungle-rails/blob/master/docs/homepage.png?raw=true)

!["Screenshot of product_reviews"](https://github.com/jenniferhsueh/jungle-rails/blob/master/docs/product_reviews.png?raw=true)

!["Screenshot of order_confirmation"](https://github.com/jenniferhsueh/jungle-rails/blob/master/docs/order_confirmation.png?raw=true)