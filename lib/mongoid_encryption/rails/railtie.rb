require 'rails/railtie'

module MongoidEncryption
  class Railtie < Rails::Railtie
    initializer "mongoid_encryption.load_encryption_config" do |app|
      encryption_config_path = Rails.root.join 'config', 'encryption.yml'

      if FileTest.exists?(encryption_config_path)
        erb = ERB.new File.read(encryption_config_path)

        yml = YAML.load(erb.result)
        env = Rails.env
        
        app.config.mongoid_encryption = if yml[env]
          yml[env]
        elsif yml[:defaults]
          yml[:defaults]
        else
          yml
        end
      else
        app.config.mongoid_encryption = {}
      end
    end
  end
end
