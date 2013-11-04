# DOC:
# We use Helper Methods for tree building,
# because it's faster than View Templates and Partials

# SECURITY note
# Prepare your data on server side for rendering
# or use h.html_escape(node.content)
# for escape potentially dangerous content
module RenderSortableTreeHelper
  module Render
    class << self
      attr_accessor :h, :options

      def render_node(h, options)
        @h, @options = h, options

        node = options[:node]

        "
          <li id='#{ node.id }_#{ options[:klass] }'>
            <div class='item'>
              <i class='fa fa-ellipsis-vertical handle'></i>
              #{ edit_link }
              #{ controls }
            </div>
            #{ children }
          </li>
        "
      end

      def edit_link
        node = options[:node]
        edit_path = h.url_for(:controller => options[:klass].pluralize, :action => :edit, :id => node)

        "#{ h.link_to node.send(options[:title]), edit_path}"
      end

      def show_link
        node = options[:node]
        ns   = options[:namespace]
        url  = h.url_for(ns + [node])
        title_field = options[:title]

        "#{ h.link_to(node.send(title_field), url) }"
      end

      def controls
        node = options[:node]
        ns   = options[:namespace]

        preview_url  = h.url_for(ns + [node])
        show_path = h.url_for(:controller => options[:klass].pluralize, :action => :show, :id => node)

        "
          <div class='controls'>
            #{ h.link_to '', preview_url, :class => 'fa fa-external-link-square' }
            #{ h.link_to '', show_path, :class => 'fa fa-trash-o delete', :method => :delete, :data => { :confirm => 'Are you sure?' } }
          </div>
        "
      end

      def children
        unless options[:children].blank?
          "<ol class='nested_set'>#{ options[:children] }</ol>"
        end
      end

    end
  end
end
