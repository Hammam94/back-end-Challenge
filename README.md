# To start working with it locally
---
> Step 1: setup ruby on rails and mysql database on your machine.
> Step 2: clone the project
> Step 3: cd inside the project and run this command `bundle`
> Step 4: put your mysql database credentials in config/database.yml.
> Step 5: run this command `rails db:create && rails db:migrate && rails db seed` but the seeds will take alot of time because it more than two milion records for me it take more than 9 hours.
> Step 6: run rails server with command `rails s`

For more info:
  After seeding try using Email "admin@admin.com" with password "12345678" with POST request body

# The two APIs end points
---
- /monopolists
- /trips/create -> send credentials in the body of the request

# How to deploy rails api
---
> Step 1: Install rbenv and Ruby on the server.
> Step 2: Install and configure Passenger & Nginx
> Step 3: Install Capistrano gems and capfiy the project
> Step 4: deploy the project.
> Step 5: run rails as production daemon.

For more Accurate i follow the instruction here and customize what i want
    https://www.jetbrains.com/help/ruby/capistrano.html#deploy

# Solution
---
#### First: system design
- Database design: (done)
    - Three tables roles - users - trips
    - Create table roles (driver - visitor) -> has many users.
    - Users -> has many trips and make trips indexed by user_id to retrevie trips more faster.
    - Make three incremental counters in user table (month_counter - year_counter - all_time_counter) and make that make calculation more faster.
    - For table users make it indexed by email so can get the account in O(1).

- Sharding database by year (performance wise) for large data scaling and it helps preventing spf problem.
- For first time query should make a parallel query on users to get trip counts in fast way
#### Second: Technology used to make solution
- ruby on rails
- mysql database
- devise gem for helping in authentication
- for sharding we can use octopus gem that has clean way doing that.
- We can use parallel gem to provide us the ability for performing parallel query
#### What I do
- All points in database design.
- Make two web services with two APIs that handles the problem in efficient way.

