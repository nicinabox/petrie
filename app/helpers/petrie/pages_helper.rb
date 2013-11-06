module Petrie
  module PagesHelper
    def ancestor
      @ancestor ||= @page.top_ancestor
    end

    def children
      @children ||= ancestor.children
    end

    def page_path(page)
      page.self_and_ancestors.collect { |a|
        a.slug unless a.home?
      }.unshift('').join('/')
    end
  end
end
