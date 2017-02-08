require 'rails_helper'

feature "User checks out all artists page" do
  scenario "they see all artist's name " do
    artists = %w(Migos Armin Julion).map do |artist_name|
      Artist.create(name: artist_name, image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    end

    visit artists_path

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end