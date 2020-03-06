# frozen_string_literal: true

require 'test_helper'

class ComposedItemTest < Minitest::Test
  def test_has_inventory
    item = Genesis::Entities::ComposedItem.new
    assert item.stockable?
  end
end
