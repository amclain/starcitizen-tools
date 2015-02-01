
require 'zip'
require 'fileutils'
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
    # @option kwargs [String] :output_dir ('.') File is extracted to this directory.
    # @example
    #   # Extract defaultProfile.xml
    #   package.extract 'Libs/Config/defaultProfile.xml'
    def extract path, **kwargs
      output_dir = kwargs.fetch :output_dir, '.'
      
      Zip::File.open(@path) do |files|
        pak_file = files.glob(path).first
        
        FileUtils.mkdir_p output_dir
        FileUtils.chdir output_dir do
          filename = path.split('/').last
          File.delete filename if File.exists? filename
          pak_file.extract pak_file.name.split('/').last
        end
      end
    end
    
  end
end
