Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "campaigns_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :disabled => false) do
                      <<-HTML
                        <% if can? :admin, Spree::Campaign %>
                          <%= tab(:campaigns, label: 'Campaigns', icon: 'bullhorn') %>
                        <% end %>
                      HTML
                     end
