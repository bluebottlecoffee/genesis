# frozen_string_literal: true

module Genesis
  module Persistence
    # ItemDefinitionRepository
    #
    # Repository for inserting/querying ItemDefinitions
    class ItemDefinitionRepository
      include Dry::Monads[:result]

      def initialize(conn)
        @table = conn[:item_definitions]
      end

      # Insert a new ItemDefinition
      #
      # Accepts +params+ as a Hash
      # Returns a Result[Sequel::DatabaseError, Id] where Id is a string
      def insert(params)
        contract.bind do |res|
          hash    = res.to_h
          attrs   = Sequel::hstore(hash[:attributes])
          version = new_version

          id = table.insert(
            hash.merge(attributes: attrs).merge(version)
          )

          Success([id, version[:version]])
        rescue Sequel::DatabaseError => e
          Failure(e)
        end
      end

      private

      attr_reader :table

      def new_version
        { version: ULID.generate }
      end

      class InsertContract < Dry::Validation::Contract
        schema do
          required(:item_definition_id).filled(:string)
          required(:name).filled(:string)
          optional(:attributes).filled(:hash)
        end
      end
    end
  end
end
