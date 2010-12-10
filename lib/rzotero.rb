require 'rubygems'
require 'open-uri'
require 'nokogiri'

$:.unshift File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__))
  
module RZotero
  
  def self.version
    @version ||= File.read(File.join(File.dirname(__FILE__), '..', VERSION))
  end
  
  VERSION = self.version
  
  autoload :client, "rzotero/client"
  
  # Module for String methods
  module Char 
    #escape - from the solr-ruby library
    # RZotero.escape('abcdef')
    # backslash everything that isn't a word character
    def escape(value)
      value.gsub(/(\W)/, '\\\\\1')
    end
    
  end
  
  # add escape to module (RZotero) -> RZotero.escape('abcdef')
  extend Char
  
  # RequestError is a common/generic exception class used by adapters
  class Request < RuntimeError
    attr_reader :context
    
    def initialize context
      @context = context
      super
    end
    
    def to_s
      context.inspect
    end
  end
     
  
end