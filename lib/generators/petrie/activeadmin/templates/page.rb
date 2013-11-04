ActiveAdmin.register Page do
  config.filters = false
  actions :all, :except => [:show]

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :parent_id, as: :select,
              collection: nested_set_options(resource_class, resource) { |i|
                "#{'&mdash;' * i.level} #{i.title}".html_safe
              }
    end

    f.inputs "Content" do
      f.sir_trevor_text_area :body
    end

    f.actions
  end

  index :download_links => false do
    render 'tree'
  end

  controller do
    include TheSortableTreeController::Rebuild

    def index
      @resource = Page.nested_set
    end

    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

  end
end
