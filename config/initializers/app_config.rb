require 'yaml'

yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'application.yml'))).result)
APP_CONFIG = HashWithIndifferentAccess.new(yaml_data)
#APP_CONFIG = YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env].to_hash
