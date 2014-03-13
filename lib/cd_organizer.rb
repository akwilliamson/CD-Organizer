class CD

  @@all_cds = []

  def CD.create(attributes)
    test_cd = CD.new(attributes)
    test_cd.save
    test_cd
  end

  def CD.all
    p @@all_cds
  end

  def CD.clear
    @@all_cds = []
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

