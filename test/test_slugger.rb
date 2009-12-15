require 'test_helper'

class TestSlugger < ActiveSupport::TestCase
  load_schema

  class Awesome < ActiveRecord::Base
    slug
  end

  class Awesomer < ActiveRecord::Base
    slug :name, :as => :path
  end

  def awesome
    @awesome ||= Awesome.new
  end

  def awesomer
    @awesomer ||= Awesomer.new
  end

  def test_default_schema_has_loaded_correctly
    assert_equal [], Awesome.all
  end

  def test_optional_schema_has_loaded_correctly
    assert_equal [], Awesomer.all
  end

  def test_defaults_are_title_and_slug
    awesome.title = "My Awesome Title"
    assert awesome.valid?
    assert_equal "my-awesome-title", awesome.slug
  end

  def test_optional_names
    awesomer.name = "My Awesomer Name"
    assert awesomer.valid?
    assert_equal "my-awesomer-name", awesomer.path
  end

end
