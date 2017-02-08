require 'rails_helper'

feature "User edits an artist" do
  scenario " they see that artist's updated info" do
    artist = Artist.create(name: "Armin", image_path:"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    updated_name = "Tiesto"

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end


