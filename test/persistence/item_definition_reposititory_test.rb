# frozen_string_literal: true

require 'test_helper'

class ItemDefinitionRepositoryTest < Minitest::Test
  def setup
    config = Genesis::Persistence.config
    conn = Sequel.connect(
      adapter: config.adapter,
      host: config.host,
      database: config.database,
      user: config.username
    )
    @repo = Genesis::Persistence::ItemDefinitionRepository.new(conn)
  end

  def test_inserting_with_valid_params
    res = @repo.insert(valid_params)

    res.fmap do |pair|
      id, version = pair

      assert id
      assert version
    end.or do |err|
      fail err
    end
  end

  def test_inserting_with_bad_params
    bad_params = {
      name: 'I have no id :-('
    }

    res = @repo.insert(bad_params)

    assert res.failure?
    res.or do |failure|
      errors = failure.errors.to_h
      assert_equal ['is missing'], errors[:item_definition_id]
    end
  end

  private

  def valid_params
    {
      item_definition_id: 'TCY0P4MPH83VEPST',
      name: 'Test item',
      attributes: {
        tagline: 'It is super delicious',
      },
    }
  end
end
