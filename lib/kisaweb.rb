$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

# stdlib
require "bigdecimal"
require "iconv"

# third party
require 'rubygems'
gem 'pauldix-typhoeus', ">=0.1.2"
require 'typhoeus'

if RUBY_VERSION > "1.9"    
  require "csv"  
  unless defined? FasterCSV
    class Object  
      FasterCSV = CSV 
      alias_method :FasterCSV, :CSV
    end  
  end
else
  $KCODE = "u"
  gem 'fastercsv', ">~1.5.0"
  require "faster_csv"
end

# internal requires
require 'kisaweb/base'
require 'kisaweb/online_ranki'
require 'kisaweb/list_item'
require 'kisaweb/runner'
require 'kisaweb/run'
require 'kisaweb/contest'
require 'kisaweb/category'
require 'kisaweb/club'