require 'rails_helper'

describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "redirect to the created playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}
        playlist.reload
        expect(playlist.name).to eq("New name")
      end

      it "assigns the requested playlist as @playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the playlist" do
        playlist = create(:playlist)
         put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}
         expect(response).to redirect_to(playlist)
      end
    end
  end
end
