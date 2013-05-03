Model Encryption
======================

### Usage

Configuration
============

The encryption requires a secret encryption key that will be used to encrypt the data stored for the model. The gem provides a Rails initializer that checks for a `config/encryption.yml` file in the application root. This file should be populated with a `key`, for which there are two possible configurations.

1. A single, simple site-wide key:

    key: 12h1jk2419h2f03f20

2. Or else individual, environment-based keys:

    production:
      key: wat2q3t23t2qtj0
    staging:
      key: 9rl20wlawaa23ks
    development:
      key: ae021lmf020200m
    test:
      key: lz9823th0q20gh0
    
Note that ERB is supported:

   key: <%= ENV['server_key'] %>-ea0129km9

If no encryption.yml configuration file is found, the value `temp` will be used as the encryption key.

Documents
============

The gem extends the MongoMapper::Document class with a method for declaring encrypted attributes, `encrypted_key`. This acts as a wrapper for `key`, and accepts the same arguments.

    class SomeModel
      include MongoMapper::Document

      key :some_field, String
      encrypted_key :another_field, String, :required => true
    end

##### Tests

Run the gem test suite with `rake test`.