module Petrie
  describe 'Home page' do
    it "redirects to /" do
      get '/home'
      expect(response).to redirect_to('/')
    end
  end

  # describe 'Unmatched pages' do
  #   it "return 404" do
  #     get '/nerp'
  #     expect(response.status).to eq(404)
  #   end
  # end
end
