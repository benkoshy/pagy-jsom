### README

### What is this?

A basic demo app showing the pagy-jsom gem: https://github.com/useo-pl/jsom-pagination

### How does it work?

* Create a collection of 100 movies:

`rake db:seed`

`rails s`

Now go to the root route. Paginate using the gem:

For HTML: http://localhost:3000/movies

For Page 2 of Json: http://localhost:3000/movies.json?page[number]=2

### Notes

* This is purely quick and dirty. Do not use this as a paragon of serlialization.

