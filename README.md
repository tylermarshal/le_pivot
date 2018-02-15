# The Pivot - Base Project

The following Rails app is used as the base project for [The Pivot](http://backend.turing.io/module3/projects/the_pivot).

[![CircleCI](https://circleci.com/gh/tylermarshal/le_pivot.svg?style=svg)](https://circleci.com/gh/tylermarshal/le_pivot)

## Setup

Built using Ruby 2.4.1 and Rails 5.1.3

Install required gems:
`$ bundle install`

Load the database dump & the other following rake commands:
```
rake import_dump:load
rails db:migrate
rake import_first_store:create
rake import_all_stores:create
rake recategorize_books:run
rake book_categories:delete
rake roles:create
rake images:upload
rake book_images:upload
```

All users have a password of `password` if you want to login and explore.

