# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Meetmanager_session',
  :secret      => '6d718a47ec4fcad3f1c84153f45651eb4a69b03269f2f2a808ca0665579dc7a5b20492490d7979aaebae02cd92e9e2fa0d1db3708361b66359267d267a2ecab9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
