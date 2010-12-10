module Zotero
  class Client
    # Defines methods related to retrieving items from Zotero
    module Items
      
      # The set of all items belonging to a specific user 
      #
      # @format :atom, :bib
      # @option options []
      # @return [Array] Items belonging to a specific user
      # @example Return items for the given user
      #   Zotero.items

      def items(options={})
        response = get('items', options)
        format.to_s.downcase == 'xml' ? response['items'] : response
      end
      
      # The set of all top-level items belong to a specific user 
      # @return [Array] The set of all top-level items belong to a specific user 
      # @example Return top-level items belonging to a specific user
      #     Zotero.top_items
      def top_items(options={})
        response = get('items/top')
        format.to_s.downcase == 'xml' ? response['items/top'] : response
      end
      
      # Show the specified item
      #
      # @overload items(userID, itemKey, options={})
      #   @param userID [String] A Zotero username
      #   @param itemKey [String] The id of the item
      #   @return [Hashie::Mash] the specified item
      #   @example Show user 43's item 3
      #   Zotero.item(43, 3)
      # @format :atom, :bib
      # @authenticated true
      # @see https://api.zotero.org/users/<userID>/items/<itemKey> 
       
      def item(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        userID = args.pop || get_user_name
        itemID = args.pop
        response = get("#{userID}/items/#{itemKey}", options)
        format.to_s.downcase == 'xml' ? response['item'] : response
      end
      
      # The set of all child items under a specific item belonging to a user 
      def item_children(*args)
        
      end
      
      # The set of all tags associated with a specific item 
      def item_tags(*args)
        
      end
      
    end
  end
end