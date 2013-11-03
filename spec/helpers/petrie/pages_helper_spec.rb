module Petrie
  describe PagesHelper do
    describe 'ancestor' do
      it "returns top ancestor" do
        @page = Page.create(title: 'Motorcycles')
        helper.ancestor.should eq @page.top_ancestor
      end
    end

    describe 'children' do
      it "returns top ancestor's children" do
        @page = Page.create(title: 'Motorcycles')
        child = Page.create(title: 'Honda', parent_id: @page.id)
        helper.children.should eq ancestor.children
      end
    end
  end
end
