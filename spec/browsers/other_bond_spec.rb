require 'bond'

describe "Bond: nil" do
  before do
    @useragent = Bond.parse(nil)
  end

  it "should return 'Mozilla' as its browser" do
    @useragent.browser.should == "Mozilla"
  end

  it "should return '4.0' as its version" do
    @useragent.version.should == "4.0"
  end

  it "should return nil as its platform" do
    @useragent.platform.should == nil
  end

  it "should return nil as its os" do
    @useragent.os.should == nil
  end

  it { @useragent.should_not be_mobile }
  it { @useragent.should_not be_bot }
end

describe "Bond: ''" do
  before do
    @useragent = Bond.parse('')
  end

  it "should return 'Mozilla' as its browser" do
    @useragent.browser.should == "Mozilla"
  end

  it "should return '4.0' as its version" do
    @useragent.version.should == "4.0"
  end

  it "should return nil as its platform" do
    @useragent.platform.should == nil
  end

  it "should return nil as its os" do
    @useragent.os.should == nil
  end

  it { @useragent.should_not be_mobile }
  it { @useragent.should_not be_bot }
end

describe "Bond: 'Mozilla/4.0 (compatible)'" do
  before do
    @useragent = Bond.parse("Mozilla/4.0 (compatible)")
  end

  it "should return 'Mozilla' as its browser" do
    @useragent.browser.should == "Mozilla"
  end

  it "should return '4.0' as its version" do
    @useragent.version.should == "4.0"
  end

  it "should return nil as its platform" do
    @useragent.platform.should == nil
  end

  it "should return nil as its os" do
    @useragent.os.should == nil
  end

  it { @useragent.should_not be_mobile }
  it { @useragent.should_not be_bot }
end

describe "Bond: 'Mozilla/5.0'" do
  before do
    @useragent = Bond.parse("Mozilla/5.0")
  end

  it "should return 'Mozilla' as its browser" do
    @useragent.browser.should == "Mozilla"
  end

  it "should return '5.0' as its version" do
    @useragent.version.should == "5.0"
  end

  it "should return nil as its platform" do
    @useragent.platform.should == nil
  end

  it "should return nil as its os" do
    @useragent.os.should == nil
  end

  it { @useragent.should_not be_mobile }
  it { @useragent.should_not be_bot }
end

describe "Bond: 'amaya/9.51 libwww/5.4.0'" do
  before do
    @useragent = Bond.parse("amaya/9.51 libwww/5.4.0")
  end

  it "should return 'amaya' as its browser" do
    @useragent.browser.should == "amaya"
  end

  it "should return '9.51' as its version" do
    @useragent.version.should == "9.51"
  end

  it "should return '5.4.0' as its libwww version" do
    @useragent.libwww.version.should == "5.4.0"
  end
end

describe "Bond: 'Rails Testing'" do
  before do
    @useragent = Bond.parse("Rails Testing")
  end

  it "should return 'Rails' as its browser" do
    @useragent.browser.should == "Rails"
  end

  it { @useragent.version.should be_nil }
  it { @useragent.platform.should be_nil }
  it { @useragent.os.should be_nil }
  it { @useragent.should_not be_mobile }
end

describe "Bond: 'Python-urllib/2.7'" do
  before do
    @useragent = Bond.parse("Python-urllib/2.7")
  end

  it "should return 'Python-urllib' as its browser" do
    @useragent.browser.should == "Python-urllib"
  end

  it "should return '2.7' as its version" do
    @useragent.version.should == "2.7"
  end

  it { @useragent.platform.should be_nil }
  it { @useragent.os.should be_nil }
  it { @useragent.should_not be_mobile }
end

describe "Bond: 'check_http/v1.4.15 (nagios-plugins 1.4.15)'" do
  before do
    @useragent = Bond.parse("check_http/v1.4.15 (nagios-plugins 1.4.15)")
  end

  it "should return 'check_http' as its browser" do
    @useragent.browser.should == "check_http"
  end

  it "should return 'v1.4.15' as its version" do
    @useragent.version.should == "v1.4.15"
  end

  it { @useragent.platform.should be_nil }
  it { @useragent.os.should be_nil }
  it { @useragent.should_not be_mobile }
end
