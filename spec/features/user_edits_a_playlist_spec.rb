require "rails_helper"

feature "User edits a playlist" do
  scenario "they see the updated playlist info" do
    playlist = create(:playlist_with_songs)
    song_one, song_two, song_three = playlist.songs
    song_four = create(:song)
  #byebug
    updated_name = "Code My Face Off"

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: updated_name
    uncheck("song-#{song_one.id}")
    check("song-#{song_four.id}")
    click_on "Update Playlist"

    expect(page).to have_content updated_name
    expect(page).to have_link song_four.title, href: song_path(song_four)
    expect(page).to_not have_link song_one.title, href: song_path(song_one)
    end
  end
