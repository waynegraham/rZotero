require 'rubygems'
require 'open-uri'
require 'nokogiri'
  
class RZotero
     
  BASE_URL = 'https://api.zotero.org'
  OLD_BASE_URL = 'http://www.zotero.org/api'
  
  def initialize(user_id, api_key)
    @user_id = user_id
    @api_key = api_key
  end
  
  def key
    return @api_key
  end
  
  def user
    return @user_id
  end
  
  # Returns all items for the user
  def items 
    url = "#{BASE_URL}/users/#{@user_id}/items?key=#{@api_key}"
    return Nokogiri.parse(open(url))
  end

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