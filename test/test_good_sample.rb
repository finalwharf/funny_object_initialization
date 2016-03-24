require_relative '../src/good_sample'
require 'test/unit'

class TestGoodSample < Test::Unit::TestCase
  attr_accessor :sample

  def test_string
    array = [1, 2, 3, 4, 5, 6]
    sample = GoodSample.new('this' => array)

    assert_respond_to(sample, :this)
    assert_equal(array, sample.this)
  end

  def test_symbol
    str = 'test_string'
    sample = GoodSample.new(:that => str)

    assert_respond_to(sample, :that)
    assert_equal(str, sample.that)
  end

  def test_internal_methods
    fake_id = 'fake_id'
    sample = GoodSample.new(:object_id => fake_id)

    assert_respond_to(sample, :object_id)
    assert_not_equal(fake_id, sample.object_id)
    assert_equal(Fixnum.name, sample.object_id.class.name)
  end
end
