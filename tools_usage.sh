# # dump the development db

#rake db:dump

# # dump the production db

#RAILS_ENV=production rake db:dump

# # dump the production db & restore it to the development db
#RAILS_ENV=production rake db:dump

# # restore db based on a backup file pattern (e.g. timestamp)

#RAILS_ENV=production rake db:restore pattern=20170101
#rake db:restore pattern=20170101

# # note: config/database.yml is used for database configuration,
# #       but you will be prompted for the database user's password