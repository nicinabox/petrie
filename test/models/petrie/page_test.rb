require 'test_helper'

module Petrie
  class PageTest < ActiveSupport::TestCase
    test "#title" do
      page = Page.new(title: 'Title')
      assert page.title == 'Title'
    end

    test "#body" do
      page = Page.new(body: 'Body')
      assert page.body == 'Body'
    end
  end
end
