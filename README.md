# learn-progress-checklist

## What is this?

This is an application built on Sinatra which allows a user to take notes on lectures.  A user can sign up, add lectures, view the lectures and take notes. All lectures, notes, and users are visible to anyone that has logged in.

All lecture URLs must be well-formed Youtube URLs that are just the video and no extra cruft. i.e. Do This: "https://www.youtube.com/watch?v=KJVTM7mE1Cc" , not this: "https://www.youtube.com/watch?v=rBkMubifO4I&list=PLE7tQUdRKcybjaXiRW_mjOuw1JGrWsCdt&index=8" (Note: This is temporary and I plan to change the URL validation later).
## To Install
```ruby
  # Move to your code directory, I am using a default in the example
  # but you can use any  directory.
  cd ~/Development/code

  # Clone the project code
  git clone git@github.com:zacscodingclub/learn-progress-checklist.git

  # Move into the new directory we just cloned
  cd learn-progress-checklist

  # Install the necessary gems
  bundle install

  # Make sure the database is empty
  rake clean_db

  # Seed the database
  rake seed

  # Startup the server
  shotgun

  # Visit the webpage in your browser at localhost:9393
```

## To-Do
* Find testers!
* Review RESTful architecture
  * Determine if any new actions should be added (lecture/delete?)
* Roles
* Seed Learn Lectures?
* Scrape Student Page
* URL Validation

## Done
* Migrations
* Migration default values
* Signup
* Signin/Signout
* Lecture
* Note
* Tag
* Lock Down
  * allow users to edit profile mehhhh something weird with passwords,
    user can edit learn name and email
  * users may only edit their own lectures
  * users may only edit their own notes All notes just stay.  You can only add to the knowledge
* Seed db
* Write Install instructions
