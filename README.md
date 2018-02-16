# Le Pivot - HomeBodies
### A multitenant application built from a brownfield codebase

The following Rails app is used as the base project for [The Pivot](http://backend.turing.io/module3/projects/the_pivot).

[![CircleCI](https://circleci.com/gh/tylermarshal/le_pivot.svg?style=svg)](https://circleci.com/gh/tylermarshal/le_pivot)

https://le-pivot-nouveau.herokuapp.com/

HomeBodies is a multitenant eCommerce platform built from a brownfield codebase. Stores can apply to sell their home-based products, which a platform admin can accept or deny. Store admins and store manager have access to manager their own stores. Registered users can shop, checkout with stripe, and register as a developer to use the item search API.

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

All users have a password of `password` if you want to login and explore.

## Database Schema

![database schema](https://i.imgur.com/5lyGtdL.png)
## Creators
[Tyler Madsen](https://github.com/tylermarshal)

[Katy Welyczko](https://github.com/katyjane8)

[Anna Lewis](https://github.com/anlewis)

[Timo Mitchel](https://github.com/timomitchel)

