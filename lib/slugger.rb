module Slugger

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods

    def slug(slug_with_attribute=:title, options = {})
      cattr_accessor :slug_attribute, :slug_with_attribute
      self.slug_attribute       = (options[:as] || :slug).to_sym
      self.slug_with_attribute  = slug_with_attribute.to_sym
      send(:validates_presence_of, slug_attribute.to_sym)
      send(:validates_presence_of, slug_with_attribute.to_sym)
      send(:before_validation_on_create, :make_slug)
      send :include, InstanceMethods
    end

  end

  module InstanceMethods

    def make_slug
      slug! unless slug_exists?
    end

    def slug!
      send((slug_attribute.to_s << '=').to_sym, slugs_to)
    end

    def slugs_to
      slug_with_attribute_value.to_slug if slug_with_attribute_value
    end

    def slug_attribute
      self.class.slug_attribute
    end

    def slug_attribute_value
      send(slug_attribute)
    end

    def slug_with_attribute
      self.class.slug_with_attribute
    end

    def slug_with_attribute_value
      send(slug_with_attribute)
    end

    def slug_exists?
      send(slug_attribute) && !send(slug_attribute).empty?
    end

  end

end

ActiveRecord::Base.send :include, Slugger
