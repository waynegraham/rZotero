module Zotero
  class Base
    attr_accessor :attrs
    alias :to_hash :attrs

    # Define methods that retrieve the value from an initialized
    # instance variable Hash, using the attribute as the key
    #
    # @overload self.lazy_attr_reader(attr)
    #   @param attr [Symbol]
    # @overload self.lazy_attr_reader(attrs)
    #   @param attrs [Attr<Symbol>]
    def self.lazy_attr_reader(*attrs)
      attrs.each do |attribute|
        class_eval do
          define_method attribute do
            @attrs[attribute.to_s]
          end
        end
      end
    end

    # Initialize a new Base object
    #
    # @param attrs [Hash]
    # @return [Zotero::Base]
    def initialize(attrs={})
      @attrs = attrs.dup
    end

    def [](method)
      self.__send__(method.to_sym)
    rescue NoMethodError
      nil
    end
  end
end
