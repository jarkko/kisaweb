$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

$KCODE = "u"

# stdlib
require "bigdecimal"

# third party
require 'rubygems'
gem 'pauldix-typhoeus', ">=0.1.2"
gem 'fastercsv', ">=1.5.0"
require 'faster_csv'
require 'typhoeus'

# internal requires
require 'kisaweb/base'
require 'kisaweb/online_ranki'
require 'kisaweb/list_item'
require 'kisaweb/runner'
require 'kisaweb/run'
require 'kisaweb/contest'