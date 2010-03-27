# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_somi_session',
  :secret      => '9cc4e9881478f7766d8783ca4ca79bd67b0a5453a72854953744f775fa3eba23e93792bb5212bd98643834fbecaf31a4d2c4486ad5f7f326a06fe2178faba33f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
