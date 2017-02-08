require 'rails_helper'

feature "User views all playlists on page" do
  scenario "they see names of all playlists" do
  playlists = create_list(:playlist_with_songs, 2)

  visit playlists_path

  playlists.each do |playlist|
    expect(page).to have_link playlist.name, href:playlist_path(playlist)
    end
  end
end

