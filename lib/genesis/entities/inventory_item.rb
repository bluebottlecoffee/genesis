# frozen_string_literal: true

module Genesis
  module Entities
    # A type of an ItemVariation that can be stocked.
    class InventoryItem
      def stockable?
        true
      end
    end
  end
end
