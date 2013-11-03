module Petrie
  describe PagesController do
    describe 'GET show' do
      it "assigns @page" do
        page = Page.create(title: 'about')
        get :show, use_route: 'petrie', page: 'about'
        expect(assigns(:page)).to eq(page)
      end

      it "finds child pages" do
        parent = Page.create(title: 'honda')
        child = Page.create(title: 'motorcycles', parent_id: parent.id)

        get :show, use_route: 'petrie', page: 'honda/motorcycles'
        expect(assigns(:page)).to eq(child)
      end

      it "resolves duplicate pages" do
        locations = Page.create(title: 'locations')
        location1 = Page.create(title: 'chicago', parent_id: locations.id)
        location2 = Page.create(title: 'nashville', parent_id: locations.id)
        location3 = Page.create(title: 'new york', parent_id: locations.id)
        jobs1 = Page.create(title: 'jobs', parent_id: location1.id)
        jobs2 = Page.create(title: 'jobs', parent_id: location2.id)
        jobs3 = Page.create(title: 'jobs', parent_id: location3.id)

        get :show, use_route: 'petrie', page: 'locations/new-york/jobs'
        expect(assigns(:page)).to eq(jobs3)
      end
    end
  end
end
