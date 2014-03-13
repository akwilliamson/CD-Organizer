require 'rspec'
require 'CD'

describe CD do

  before do
    CD.clear
  end

  it 'initializes a CD with an album name and artist name' do
    test_cd = CD.new({:artist => 'picasso', :album => 'photo album'})
    test_cd.should be_an_instance_of CD
  end

  describe '.all' do
    it 'should be empty at first' do
      new_cd = CD.new({:artist => 'picasso', :album => 'photo album'})
      CD.all.should eq []
    end
  end

  describe '.create' do
    it 'creates a new instance of cd' do
      test_cd = CD.create({:artist => 'picasso', :album => 'photo album'})
      test_cd.should be_an_instance_of CD
    end
    it 'saves the instance to the array of cds' do
      test_cd = CD.create({:artist => 'picasso', :album => 'photo album'})
      test_cd.should be_an_instance_of CD
      CD.all.should eq [test_cd]
    end
  end

  describe '#save' do
    it 'saves the instance of CD to the list of all CDs' do
      test_cd = CD.create({:artist => 'picasso', :album => 'photo album'})
      CD.all.should eq [test_cd]
    end
  end

  describe '.search' do
    it 'gives a matching cd by either artist or album' do
      test_cd1 = CD.create({:artist => 'picasso', :album => 'photo album'})
      test_cd2 = CD.create({:artist => 'van ghoh', :album => 'painting album'})
      test_cd3 = CD.create({:artist => 'monet', :album => 'wedding album'})
      CD.search('wedding album').should eq test_cd3
    end
  end
end


