require 'rails_helper'

feature "User views an artist's page" do
  scenario "they delete that artist and are redirected to the artists index and do not see that artist" do
    artist = Artist.create(name: "Armin", image_path:"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content artist.name
    expect(page).to_not have_css("img[src=\"#{artist.image_path}\"]")
  end
end