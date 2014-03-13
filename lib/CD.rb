class CD

  @@all_cds = []

  def CD.create(attributes)
    test_cd = CD.new(attributes)
    test_cd.save
    test_cd
  end

  def CD.all
    @@all_cds
  end

  def CD.clear
    @@all_cds = []
  end

  def CD.search(search_term)
    @search_result = []
    @@all_cds.each do |cd|
      if cd.artist == search_term || cd.album == search_term
        @search_result << cd
      end
    end
    @search_result
  end

  attr_reader(:artist, :album)

  def initialize(attributes)
    @artist = attributes[:artist]
    @album = attributes[:album]
  end

  def save
    @@all_cds << self
  end

end

test_cd1 = CD.create({:artist => 'monet', :album => 'photo album'})
test_cd2 = CD.create({:artist => 'van ghoh', :album => 'painting album'})
test_cd3 = CD.create({:artist => 'monet', :album => 'wedding album'})

# puts CD.all









# puts test_cd1.album







