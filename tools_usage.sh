# dump the development db
rake db:dump

# dump the production db
RAILS_ENV=production rake db:dump

# dump the production db & restore it to the development db
RAILS_ENV=production rake db:dump
rake db:restore

# note: config/database.yml is used for database configuration,
#       but you will be prompted for the database user's password