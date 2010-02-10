# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yesdatabas_session',
  :secret      => '26eb964fae7ae2b5b5d09f496a90e83388e53639735c240068b5ef4f46c9257d142b891c28c7ae6f45e44fae9b0a7797ce7c0bb6c74043c45e8802ad00adf34d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
