module Petrie
  module PagesHelper
    def ancestor
      @ancestor ||= @page.top_ancestor
    end

    def children
      @children ||= ancestor.children
    end
  end
end
