module Kisaweb
  class Base
    include ::Typhoeus
    
    remote_defaults :base_uri => "http://kisaweb.ssl.fi/base"
  end
end