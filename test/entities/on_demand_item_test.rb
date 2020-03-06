# frozen_string_literal: true

require 'test_helper'

class OnDemandItemTest < Minitest::Test
  def test_has_no_inventory
    item = Genesis::Entities::OnDemandItem.new
    refute item.stockable?
  end
end
