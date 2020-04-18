require "bundler/setup"
require "ascii_grid"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  module Helpers
    def fixture_path(path)
      File.join(File.dirname(__FILE__), 'fixtures', path)
    end

    def read_fixture(path)
      File.read(fixture_path(path))
    end
  end

  config.include Helpers
end
