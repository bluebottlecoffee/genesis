# frozen_string_literal: true

require 'dry/monads'
require 'dry/validation'
require 'sequel'
require 'ulid'
require 'yaml'

Dry::Validation.load_extensions(:monads)
Sequel.extension :pg_hstore, :pg_hstore_ops

module Genesis
  module Persistence
    class << self
      attr_reader :config

      # Configuration
      #
      # Needs +env+ of either:
      #   - :development
      #   - :test
      #   - :production
      def configure(env = :development)
        @config = Configuration.new(env)
        yield config if block_given?
      end
    end

    ENVIRONMENTS = %i[development test production].freeze

    # Persistence Configuration
    class Configuration
      InvalidEnvironmentError = Class.new(RuntimeError)

      attr_accessor :adapter, :database, :host, :port, :username

      def initialize(env)
        raise InvalidEnvironmentError, "invalid environment: #{env}" unless ENVIRONMENTS.include?(env)

        @adapter = 'postgres'
        load_config(env)
      end

      def load_config(env)
        file = YAML.load_file('config/database.yaml')
        db = file[env.to_s]

        @database = db['database']
        @host     = db['host']
        @port     = db['port']
        @username = db['username']
      end
    end
  end
end

require 'genesis/persistence/item_definition_repository'
