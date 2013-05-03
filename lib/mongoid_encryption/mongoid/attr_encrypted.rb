module MongoidEncryption
  module Mongoid
    module AttrEncrypted
      extend ActiveSupport::Concern

      module ClassMethods
        def encrypted_key(*args)
          method = args.shift
          field "encrypted_#{method}", *args
          attr_encrypted method, :key => :encryption_key, :encode => true
        end
      end        

      def encryption_key
        defined?(Rails) && Rails.application.config.mongoid_encryption.key || 'temp'
      end
    end
  end
end

Mongoid::Document.send(:include, MongoidEncryption::Mongoid::AttrEncrypted)