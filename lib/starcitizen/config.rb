
require 'yaml'

module StarCitizen
  # Configuration for starcitizen-tools.
  class Config
    
    # Location of Star Citizen.
    def self.game_path
      new.game_path
    end
    
    
    # Config file path.
    attr_reader :path
    
    # @option kwargs [String] :path Config file path.
    def initialize **kwargs
      @path = File.expand_path kwargs.fetch(:path, '~/starcitizen-tools.cfg.yaml')
      
      # Create config file.
      unless File.exists? @path
        begin
          require 'win32/registry'
          game_path = File.dirname Win32::Registry::HKEY_CURRENT_USER
            .open('Software\Cloud Imperium Games\StarCitizen')['UninstallString']
        rescue LoadError # Not Windows
          game_path = File.expand_path '~/.wine/drive_c/Program Files/StarCitizen'
        end
        
        File.open(@path, 'w') do |f|
          f.write({ 'game_path' => game_path }.to_yaml)
        end
      end
      
      @config = YAML.load_file @path
    end
    
    # Location of Star Citizen.
    def game_path
      @config['game_path'].gsub('\\', '/')
    end
    
  end
end
