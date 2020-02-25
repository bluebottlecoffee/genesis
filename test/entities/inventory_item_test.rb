# frozen_string_literal: true

require 'test_helper'

class InventoryItemTest < Minitest::Test
  def test_has_inventory
    item = Genesis::Entities::InventoryItem.new
    assert item.stockable?
  end
end
