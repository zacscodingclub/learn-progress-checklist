# learn-progress-checklist

# To Install
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

## Done
*~~ Migrations~~
*~~ Migration default values~~
*~~ Signup~~
*~~ Signin/Signout~~
*~~ Lecture~~
*~~ Note~~
*~~ Tag~~
*~~ Lock Down~~

  *~~allow users to edit profile~~ mehhhh something weird with passwords,
    ~~user can edit learn name and email~~
  *~~ users may only edit their own lectures~~
  *~~ ~~users may only edit their own notes~~ All notes just stay.  You can only add to the knowledge~~
*~~ Seed db~~
*~~ Write Install instructions~~
