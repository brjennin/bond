require 'bond/browsers/all'
require 'bond/browsers/gecko'
require 'bond/browsers/internet_explorer'
require 'bond/browsers/opera'
require 'bond/browsers/webkit'

class Bond
  module Browsers
    Security = {
      "N" => :none,
      "U" => :strong,
      "I" => :weak
    }.freeze

    def self.all
      [InternetExplorer, Webkit, Opera, Gecko]
    end

    def self.extend(array)
      array.extend(All)
      all.each do |extension|
        return array.extend(extension) if extension.extend?(array)
      end
    end
  end
end
