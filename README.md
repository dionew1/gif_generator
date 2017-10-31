# README

**Gif Generator**
App deployed on heroku [gif-g](https://gif-g.herokuapp.com/)

This app was created with:
* Ruby version 2.4.1
* Rails 5.1.4
* API key from Giphy API(You will need to supply your own key)

****Getting Started****
Run the following terminal commands:
1. `git clone`
2. `bundle`
3. `rake db:create db:migrate`
4. `rails s`

Now that your local server is running you can open the app in your browser from `localhost:portnumber`
This should bring you to the welcome page.


****Purpose****
The purpose of this app is for a user to be able to favorite and unfavorite gifs that are created by the admin.

An admin user can randomly create gifs using the Giphy API. Admins create a category via the search term entered to generate the gif. They are also able to delete a single gif or category with all gifs associated to it.

****Creating an Admin****
To create an admin locally:
1. Run `rails c` from terminal
2. Input `User.create(username: "YOUR TEXT", password: "YOUR TEXT", role: 1)`
3. You are now able to login using the admin user you have just created.
