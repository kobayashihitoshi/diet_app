# config/initializers/openai.rb

ENV["OPENAI_API_KEY"] ||= Rails.application.credentials.openai_api_key
