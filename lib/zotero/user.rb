require 'zotero/base'

module Zotero
  class User

    #alias :verified? :verified
    
    # @param other [Zotero::User]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

  end
end
