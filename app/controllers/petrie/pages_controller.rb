require_dependency "petrie/application_controller"

module Petrie
  class PagesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    before_filter :assign_page

    def home
    end

    def show
    end

  private

    def assign_page
      @page = find_by_slug
    end

    def find_by_slug
      page_slugs = (params[:page] || 'home').split(/\//).reverse
      candidates = Page.where(slug: page_slugs.first)

      return not_found if candidates.empty?
      return candidates.first if candidates.count == 1

      resolve_duplicates(page_slugs, candidates)
    end

    def resolve_duplicates(page_slugs, candidates)
      page_slugs.shift
      page_slugs.each do |page|
        parent_candidate = Page.friendly.find(page)

        candidates.each do |c|
          return c if parent_candidate.is_ancestor_of?(c)
        end
      end
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

  end
end
