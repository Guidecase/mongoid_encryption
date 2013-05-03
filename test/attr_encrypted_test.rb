require_relative 'test_helper'

class AttrEncryptedTest < MiniTest::Unit::TestCase
  def test_that_encrypted_key_field_is_encrypted
    MockModel.encrypted_key :name, :type => String
    doc = MockModel.new :name => 'test'

    refute_nil doc.encrypted_name
    refute_equal doc.encrypted_name, doc.name
    assert_equal 'test', doc.name
  end

  def test_that_model_has_default_encryption_key
    doc = MockModel.new
    assert_equal 'temp', doc.encryption_key
  end  
end