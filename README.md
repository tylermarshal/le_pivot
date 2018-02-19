# Le Pivot - HomeBodies
### A multitenant application built from a brownfield codebase

The following Rails app is used as the base project for [The Pivot](http://backend.turing.io/module3/projects/the_pivot).

https://le-pivot-nouveau.herokuapp.com/

HomeBodies is a multitenant eCommerce platform built from a brownfield codebase. It was a group project built by 4 students at Turing School of Sofware & Design.

Stores can apply to sell their home-based products, which a platform admin can accept or deny. Store admins and store manager have access to manager their own stores. Registered users can shop, checkout with stripe, and register as a developer to use the item search API.

## Creators
[Tyler Madsen](https://github.com/tylermarshal)

[Katy Welyczko](https://github.com/katyjane8)

[Anna Lewis](https://github.com/anlewis)

[Timo Mitchel](https://github.com/timomitchel)

## Setup & Installation

Built using Ruby 2.4.1 and Rails 5.1.3

Clone le_pivot down into a directory of your choosing.

```
git clone https://github.com/tylermarshal/le_pivot.git
```

Install required gems:
`bundle install`

Load the database dump & execute the other following rake commands:
```
bundle exec rake import_dump:load
bundle exec rake db:migrate
bundle exec rake import_first_store:create
bundle exec rake import_all_stores:create
bundle exec rake recategorize_books:run
bundle exec rake book_categories:delete
bundle exec rake roles:create
bundle exec rake import_example_users:create
bundle exec rake images:upload
bundle exec rake book_images:upload
```

## Testing

To begin testing, you will want start a server for the le_pivot directory in a new tab:

```
rails s
```

In the first tab (not the one running the server), which should be in the le_pivot directory, enter the following to run the local test suite:

```
bundle exec rspec
```

## Use
The following users are available for exploring the application:
- registered_customer: sandy@example.com
- store_manager@example.com
- store_admin@example.com
- platform_admin@example.com

All users have a password of `password` if you want to login and explore.

### Item Search API Endpoints

You can search for items by title or description using the following endpoint: get /api/v1/search?type=items&q=[query]&api_key=[your_api_key] 

To register an account as a developer and receive an API key, login and navigate to `/dashboard`, click on `Developer Settings`, and then hit `Register as a Developer`. You can view your API key on this screen and you will also have a copy sent to the email address tied to your account.

In your local environment, set a default api key ENV['search_api_key'] to use the Item Search bar in the global navigation.

## Database Schema

![database schema](https://i.imgur.com/u4cqLi2.png)


