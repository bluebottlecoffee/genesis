# frozen_string_literal: true

require 'test_helper'

class ItemDefinitionTest < Minitest::Test
  def test_initialization
    assert Genesis::Entities::ItemDefinition.new(attributes)
  end

  def test_has_items
    item = Genesis::Entities::Item.new
    definition = Genesis::Entities::ItemDefinition.new(
      attributes.merge(items: [item])
    )

    refute definition.items.empty?
  end

  private

  def attributes
    {
      item_definition_id: '01E21GNX7ZT7CV7F3RQTX7ZZB8',
      version: '01E21GMN3X6BN9VSW6QQ8QCWW4',
      name: 'Latte',
      tagline: 'a short description',
      summary: 'a long description that goes on and on and on',
      specifications: [],
      items: []
    }
  end
end
