
describe StarCitizen::Config do
  
  specify "default path is home folder" do
    subject.path.should eq File.expand_path('~/starcitizen-tools.cfg.yaml')
  end
  
  describe "config file" do
    subject { StarCitizen::Config.new path: config_path }
    let(:config_path) { 'spec/starcitizen-tools.cfg.yaml' }
    
    after { File.delete config_path if File.exists? config_path }
    
    describe "game_path" do
      let(:game_path) { 'C:/Program Files/StarCitizen' }
      
      it "is discovered from registry if config file doesn't exist" do
        require 'win32/registry'
        Win32::Registry::HKEY_CURRENT_USER.should_receive(:open).at_least(:once) \
          {{ 'UninstallString' => "#{game_path}/uninst.exe" }}
        
        subject.game_path.should eq game_path
      end if RUBY_PLATFORM.include? '-mingw32'
    end
    
  end
  
end
