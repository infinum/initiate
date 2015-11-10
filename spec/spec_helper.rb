require 'bundler/setup'

Bundler.require(:default, :test)

require (Pathname.new(__FILE__).dirname + '../lib/initiate').expand_path

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include InitiateTestHelpers
  config.before(:all) do
    create_tmp_directory
  end
end
