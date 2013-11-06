module Petrie
  describe Page do
    it "should have a #title" do
      page = Page.new(title: 'Title')
      expect page.title == 'Title'
    end

    it "should have a #body" do
      page = Page.new(body: 'Body')
      expect page.body == 'Body'
    end

    it 'should have a #slug' do
      page = Page.create!(title: 'Test Page')
      expect page.slug == 'test-page'
    end

    it 'generates new slug if title changes' do
      page = Page.create!(title: 'Test Page')
      page.title = 'Buster'
      page.save!
      expect page.slug == 'buster'
    end

    it 'uses nested set' do
      page = Page.create(title: 'Test Page')
      assert Page.roots.include? page
    end

    describe '#top_ancestor' do
      it 'returns the top ancestor for the current page' do
        parent = Page.create(title: 'Parent Page')
        child = Page.create(title: 'Child Page', parent_id: parent.id)
        assert child.top_ancestor == parent
      end
    end

    describe '#top_ancestor?' do
      it 'returns true if page is #top_ancestor' do
        parent = Page.create(title: 'Parent Page')
        child = Page.create(title: 'Child Page', parent_id: parent.id)
        parent.top_ancestor?.should be_true
        child.top_ancestor?.should_not be_true
      end
    end

  end
end
