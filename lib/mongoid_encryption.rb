require 'attr_encrypted'
require 'mongoid'

module MongoidEncryption
end

require_relative 'mongoid_encryption/version'
require_relative 'mongoid_encryption/mongoid/attr_encrypted'
require_relative 'mongoid_encryption/rails/railtie' if defined?(Rails)