# frozen_string_literal: true

require 'test_helper'

class VersionTest < Minitest::Test
  def test_version
    assert_equal '0.1.0', Genesis::VERSION
  end
end
