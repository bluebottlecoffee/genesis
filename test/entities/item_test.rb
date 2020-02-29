# frozen_string_literal: true

require 'test_helper'

class ItemTest < Minitest::Test
  def test_initialization
    assert Genesis::Entities::Item.new(attributes)
  end

  private

  # channels [order_ahead retail_cafe ecomm production]
  def attributes
    {
      sku: 'LTE-HVE-8OZ',
      version: '01E274FMJB2Q6CN1AV31CJV4T7',
      definition: Genesis::Entities::ItemDefinition.new,
      name: 'Hayes Valley',
      image_urls: [],
      available_at: {
        order_ahead: %w[1167 0001],
        retail: %w[1167]
      }
    }
  end
end
