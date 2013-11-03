module Petrie
  class Page < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: [:scoped, :slugged], scope: :parent

    acts_as_nested_set

    def should_generate_new_friendly_id?
      title_changed?
    end

    def top_ancestor
      return parent.top_ancestor if parent
      self
    end
  end
end
