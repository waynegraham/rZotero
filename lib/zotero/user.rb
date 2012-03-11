require 'zotero/base'

module Zotero
  class User < Zotero::Base

    lazy_attr_reader :id

    # @param other [Zotero::User]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

  end
end
