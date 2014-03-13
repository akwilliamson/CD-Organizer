require './lib/CD'

  def main_menu

    puts "sup bruh, welcome to the CD store"
    puts "c - create new CD"
    puts "v - view CDs"
    puts "s - search CDs"
    puts "a - all your artists"
    puts "g - go fishing!"
    input = gets.chomp
    puts "\e[H\e[2J"
    if input == 'c'
      new_cd
    elsif input == 'v'
      view_cds
    elsif input == 's'
      search
    elsif input == 'a'
      list_artists
    elsif input == 'g'
      puts 'use google maps to find the nearest lake! peace!'
    else
      'invalid input bruh'
      main_menu
    end
  end

  def new_cd
    puts "Please enter an artist name: "
    artist = gets.chomp
    puts "Please enter an album name: "
    album = gets.chomp
    CD.create({:artist => artist, :album => album})
    puts "#{album} has been added!"
    main_menu
  end

  def view_cds
    CD.all.each do |cd|
      puts "Album: #{cd.album}   -   Artist: #{cd.artist}"
    end
    puts "m - main menu"

    input = gets.chomp
    if input == 'm'
      main_menu
    else
      'invalid input'
      main_menu
    end

  end

  def search
    puts "please enter an album or artist to search: "
    input = gets.chomp
    result = CD.search(input)
    if result == []
      puts "There are no CDs for this search\n"
      main_menu
    end
    puts "CD(s) listed below."
    result = CD.search(input)
    puts "*****************************************************"
    result.each do |i|
      puts "Album: #{i.album}   -   Artist: #{i.artist}"
    end
    puts "*****************************************************\n\n\n"
    main_menu
  end

  def list_artists
    @artists = []
    albums_array = []
    CD.all.each do |cd|
      @artists << cd.artist
    end
    @artists.uniq!
    @artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist}"
    end

    puts "m - main menu"
    puts "c - choose artist to list albums by that artist"
    input = gets.chomp
    if input == 'c'
      puts "Enter index of the artist you want to view albums for"
      input = gets.chomp
      @artists.each_with_index do |artist_name, index|
        if (input.to_i-1) == index
          CD.all.each do |cd|
            if artist_name == cd.artist
              albums_array << cd.album
            end
          end
          # p albums_array
          albums_array.each do |album|
            puts "#{album}"
          end
        end
      end
    elsif input == 'm'
      main_menu
    else
      'invalid input'
      main_menu
    end
  end

main_menu
