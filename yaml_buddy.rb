# frozen_string_literal: true

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  require 'yaml'

  def take_yaml(yaml)
    # convert YAML string into array of hashes
    @data = YAML.load(yaml)
  end

  def to_yaml
    YAML.dump(@data)
  end
end
