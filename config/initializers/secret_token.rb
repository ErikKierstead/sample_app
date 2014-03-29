# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '8cfe3475252ba713a5cc8dd7c95e24e0c51530a088a01e31a96903ee1d922d945af1b14ab12e7f485f6ab0e44750bc00e2d87cf876702b9eb76e7f8fcfdf9f0d'

require 'securerandom' 

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
        File.read(token_file).chomp
    else
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end


SampleApp::Application.config.secret_key_base = secure_token
#'8cfe3475252ba713a5cc8dd7c95e24e0c51530a088a01e31a96903ee1d922d945af1b14ab12e7f485f6ab0e44750bc00e2d87cf876702b9eb76e7f8fcfdf9f0d'
