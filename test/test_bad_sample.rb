require_relative '../src/bad_sample'
require 'test/unit'

class TestBadSample < Test::Unit::TestCase
  attr_accessor :sample

  def test_string
    array = [1, 2, 3]
    sample = BadSample.new('this' => array)

    assert_respond_to(sample, :this)
    assert_equal(array, sample.this)
  end

  def test_symbol
    str = 'test'
    sample = BadSample.new(:that => str)

    assert_respond_to(sample, :that)
    assert_equal(str, sample.that)
  end

  def test_internal_methods
    fake_id = 'fake_id'
    sample = BadSample.new(:object_id => fake_id)

    assert_respond_to(sample, :object_id)
    assert_equal(fake_id, sample.object_id)
  end
end
