require 'rubygems'
require 'rzotero'
# require 'open-uri'
require 'nokogiri'
require 'openurl'
require 'pp'
 

zotero = RZotero.new(43, 'knpzrwh1pos4ggtzqt1y4195')

puts zotero.user
puts zotero.key

puts zotero.items
item = zotero.item(11944)

p item.inspect

# @id = item.xpath("//id/node()")
# @title = item.xpath("//title/node()")
# #uri = item.xpath("//uri/node()")
# #link = item.xpath("//id/node()")
# @published = item.xpath("//published/node()")
# #item_id = item.xpath("//itemid/node()")
# 
# @authors = item.xpath("//tr[@class='creator']/td/node()")
# @item_type = item.xpath("//tr[@class='itemType']/td/node()")
# @publisher = item.xpath("//tr[@class='publisher']/td/node()")
# @date = item.xpath("//tr[@class='date']/td/node()")
# 
# context_object = OpenURL::ContextObject.new
# 
# # Add metadata to the Context Object Entities
# 
# context_object.referent.set_format(@item_type.to_s)
# context_object.referent.add_identifier(@id.to_s)
# context_object.referent.set_metadata('au', @authors.to_s)
# context_object.referent.set_metadata('pub', @publisher.to_s)
# context_object.referent.set_metadata('place', @published.to_s)
# context_object.referent.set_metadata('title', @title.to_s)
# context_object.referent.set_metadata('date', @date.to_s)
# 
# pp context_object.coins


 
