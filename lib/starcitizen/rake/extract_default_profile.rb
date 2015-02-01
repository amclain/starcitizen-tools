require 'rake'
require 'rake/tasklib'

module StarCitizen
  module Rake
    
    # Extract defaultProfile.xml from GameData.pak
    class ExtractDefaultProfile < ::Rake::TaskLib
      
      attr_accessor :name
      
      def initialize name = :extract_default_profile
        @name = name
        yield self if block_given?
        
        desc "Extract defaultProfile.xml from GameData.pak"
        
        task(name) do
          require 'starcitizen-tools'
          StarCitizen::Pak.new('GameData').extract 'Libs/Config/defaultProfile.xml'
        end
      end
      
    end
  end
end
