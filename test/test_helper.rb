ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def log_in_as(_user = nil, password: "password", remember_me: "1")
      post login_path, params: {
        session: {
          email: "test1@example.com",
          password: password,
          remember_me: remember_me
        }
      }
    end
  end
end
