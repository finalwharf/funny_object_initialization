require_relative '../src/lazy_hash'
require 'test/unit'

class TestLazyHash < Test::Unit::TestCase
  attr_accessor :lazy_hash

  def setup
    @lazy_hash = LazyHash.new
  end

  def teardown
    @lazy_hash = nil
  end

  def test_string_keys
    lazy_hash[:test] = :test
    assert_equal(:test, lazy_hash['test'])
  end

  def test_symbol_keys
    lazy_hash['test'] = 'test'
    assert_equal('test', lazy_hash[:test])
  end

  def test_fixnum_keys
    lazy_hash[123] = 123
    assert_equal(123, lazy_hash[123])
  end

  def test_missing_keys
    assert_nil(lazy_hash[:missing_key])
    assert_nil(lazy_hash['missing_key'])
    assert_nil(lazy_hash[1234567890])
    assert_nil(lazy_hash[[a: :b]])
  end
end
