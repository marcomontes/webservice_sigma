# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_webservice_sigma_session',
  :secret      => 'e237c3068e52b1ee576bb0490b63836ea748200bf7e299906d1a84e386e667817951b260283c3b678f385a3ffde9660386db90e2a300bb4507ad69fe85b2a070'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
