# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_authenticated_resource_example_session',
  :secret      => 'f7b3a41b1b8939eb0730d36b24fa464a1ae37d3ab26c5e4e61d87d5543d3d3c19105a81599b9a382bd0d907e14bb8644b976c4499240fca682b79ebd3f7dba44'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
