
require 'rake'
require 'rake/tasklib'

module StarCitizen
  module Rake
    
    # Extract defaultProfile.xml from GameData.pak
    class ExtractDefaultProfile < ::Rake::TaskLib
      
      attr_accessor :name
      attr_accessor :output_dir
      
      def initialize name = :extract_default_profile
        @name = name
        @output_dir = '.'
        yield self if block_given?
        
        desc "Extract defaultProfile.xml from GameData.pak"
        
        task(name) do
          require 'starcitizen-tools'
          StarCitizen::Pak.new('GameData').extract 'Libs/Config/defaultProfile.xml',
            output_dir: @output_dir
        end
      end
      
    end
  end
end
