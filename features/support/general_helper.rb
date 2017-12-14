require 'yaml'
require 'base64'

# helper module with various useful methods available in the step definitions
module GeneralHelper

  def read_yaml(yaml_file)
    return YAML.load_file(yaml_file) if File.file?(yaml_file)
    {}
  end

  def get_random_digit(num_of_digits = 4)
    num_of_digits.times.map { Random.rand(0..9) }.join('')
  end

  def decode(string)
    Base64.strict_decode64(string)
  end

end

World(GeneralHelper)