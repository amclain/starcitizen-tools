
describe StarCitizen::Pak do
  
  subject { StarCitizen::Pak.new package }
  let(:package) { 'GameData' }
  
  describe "extract" do
    let(:filename) { 'defaultProfile.xml' }
    let(:path) { "Libs/Config/#{filename}" }
    
    after { File.delete filename if File.exists? filename }
    
    specify do
      File.exists?(filename).should eq false
      subject.extract path
      File.exists?(filename).should eq true
    end if INTEGRATION_TEST
  end
  
end
