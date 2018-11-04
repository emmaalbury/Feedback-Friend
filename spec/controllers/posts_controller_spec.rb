require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { text: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a new review' do
      post :create, params: { post: { text: "You're an ace coach!" } }
      expect(Post.find_by(text: "You're an ace coach!")).not_to be nil
    end

    it 'edits a review' do
      post :create, params: { post: { text: "Slowing from fatigue" } }
      post_to_edit = Post.find_by(text: "Slowing from fatigue")
      edited_post = Post.find(post_to_edit.id)
      edited_post.update(text: "Snooze o'clock!")
      expect(post_to_edit.text).not_to be("Slowing from fatigue")
    end
  end

end

   

# require 'rails_helper'
#
# RSpec.describe PostController, type: :controller do
#
#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end
# atom .

# end
