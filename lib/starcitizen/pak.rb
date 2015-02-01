
require 'zip'
require_relative 'config'

module StarCitizen
  
  # A .pak file.
  # Located in /CitizenClient/Data
  class Pak
    
    attr_reader :name
    
    # @param name [String] Name of the .pak file.
    def initialize name
      @name = name
      @path = "#{StarCitizen::Config.game_path}/CitizenClient/Data/#{name}.pak"
    end
    
    # Extract a file from the package.
    # @param path [String] Path of the file inside the package.
    # @example
    #   # Extract defaultProfile.xml
    #   package.extract 'Libs/Config/defaultProfile.xml'
    def extract path
      filename = path.split('/').last
      File.delete filename if File.exists? filename
      
      Zip::File.open(@path) do |files|
        pak_file = files.glob(path).first
        pak_file.extract pak_file.name.split('/').last
      end
    end
    
  end
end
