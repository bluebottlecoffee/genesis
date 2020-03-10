# frozen_string_literal: true

require 'test_helper'

class OnDemandComposedItemTest < Minitest::Test
  def test_has_no_inventory
    item = Genesis::Entities::OnDemandComposedItem.new
    refute item.stockable?
  end
end
