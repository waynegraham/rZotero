require 'rubygems'
require 'rzotero'
# require 'open-uri'
require 'nokogiri'
require 'openurl'
require 'will_paginate'


zotero = Zotero.new(43, 'SqbbheQDVlJQUgd9NQVgnUjT')

# puts zotero.user
# puts zotero.key

# next_link = zotero.items.xpath("//atom:link[@rel='next']")
# previous_link = zotero.items.xpath("//atom:link[@rel='previous']")
# # 
# puts next_link
# puts previous_link

puts zotero.items

#items = zotero.items.to_a

#items.each do |item|
  #p item.inspect
#end

# item = zotero.item(11944)
# 
# p item.inspect