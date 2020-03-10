# frozen_string_literal: true

require 'dry/monads'
require 'dry/validation'
require 'sequel'
require 'ulid'

Dry::Validation.load_extensions(:monads)
Sequel.extension :pg_hstore, :pg_hstore_ops

module Genesis
  module Persistence
  end
end

require 'genesis/persistence/item_definition_repository'
