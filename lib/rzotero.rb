require 'rubygems'
require 'open-uri'
require 'nokogiri'
  
class RZotero
     
  BASE_URL = 'https://api.zotero.org'
  
  attr_accessor :rzotero_error
  
  def initialize(user_id, api_key)
    @rzotero_error = false
    begin
       #TODO need to check if the user_id is numeric; 
      raise TypeError, "user_id must be an Integer" unless user_id.kind_of? Integer
      raise TypeError, "api_key must be a String" unless api_key.kind_of? String
  
      @user_id = user_id
      @api_key = api_key
    rescue TypeError
      @rzotero_error = true
    end
  end
  
  def key
    return @api_key
  end
  
  # def key!(api_key)
  #    raise TypeError, "api_key must be a String" unless user_id.kind_of? String
  #    @api_key = api_key
  #  end
  
  def user
    return @user_id
  end
  
  # def user!(user_id)
  #     raise TypeError, "user_id must be an Integer" unless user_id.kind_of? Integer
  #     @user_id = user_id
  #   end
  
  def base
    return BASE_URL
  end
  
  # Returns all items for the user
  def items 
    url = "#{BASE_URL}/users/#{@user_id}/items?key=#{@api_key}"
    return Nokogiri.parse(open(url))
  end
  
  # Returns a specific item
  def item(id)
    url = "#{BASE_URL}/users/#{@user_id}/items/#{id}?key=#{@api_key}"
    return Nokogiri.parse(open(url))
  end

  def item_children(id)
    url = "#{BASE_URL}/users/#{@user_id}/items/#{id}/children?key=#{@api_key}"
    return Nokogiri.parse(open(url))
  end

  def collections 
    url = "#{BASE_URL}/users/#{@user_id}/collections?key=#{@api_key}"
    return Nokogiri.parse(open(url))
  end

  def collection(id)
    url = "#{BASE_URL}/users/#{@user_id}/collections/#{id}?key=#{@api_key}"
    return Nokogiri.parse(open(url))
  end

  # def user_id
  #     url = "#{OLD_BASE_URL}/users/#{USER}"
  #     doc = Nokogiri.parse(open(url)).xpath("//id")
  #     return doc.to_s[/[0-9]+/]
  #   end
end