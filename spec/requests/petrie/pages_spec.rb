module Petrie
  describe 'Home page' do
    it "redirects to /" do
      get '/home'
      expect(response).to redirect_to('/')
    end
  end

  describe 'Unmatched pages' do
    it "return 404" do
      expect {
        get '/nerp'
      }.to raise_error(ActionController::RoutingError)
    end
  end
end
