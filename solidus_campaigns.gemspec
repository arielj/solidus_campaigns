# -*- encoding: utf-8 -*-
# stub: solidus_campaigns 1.1.0 ruby lib

Gem::Specification.new do |s|
    s.name = "solidus_campaigns".freeze
    s.version = "1.0.0"

    s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
    s.require_paths = ["lib".freeze]
    s.authors = ["Ariel Juodziukynas".freeze]
    s.date = "2018-06-06"
    s.description = "Campaigns for Solidus E-Commerce platform.".freeze
    s.email = "arieljuod@gmail.com".freeze
    #s.files = [".gitignore".freeze, ".rspec".freeze, "Gemfile".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "app/assets/javascripts/spree/backend/solidus_campaigns.js".freeze, "app/assets/javascripts/spree/frontend/solidus_campaigns.js".freeze, "app/assets/stylesheets/spree/backend/solidus_campaigns.css".freeze, "app/assets/stylesheets/spree/frontend/solidus_campaigns.css.scss".freeze, "app/controllers/spree/admin/blog_entries_controller.rb".freeze, "app/controllers/spree/blog_entries_controller.rb".freeze, "app/controllers/spree/store_controller_decorator.rb".freeze, "app/helpers/spree/admin/navigation_helper_decorator.rb".freeze, "app/helpers/spree/blog_entries_helper.rb".freeze, "app/models/spree/app_configuration_decorator.rb".freeze, "app/models/spree/blog_entry.rb".freeze, "app/models/spree/blog_entry_image.rb".freeze, "app/models/spree/user_decorator.rb".freeze, "app/overrides/add_blog_admin_menu_tab.rb".freeze, "app/overrides/add_user_admin_author_info_fields.rb".freeze, "app/views/spree/admin/blog_entries/_form.html.erb".freeze, "app/views/spree/admin/blog_entries/edit.html.erb".freeze, "app/views/spree/admin/blog_entries/index.html.erb".freeze, "app/views/spree/admin/blog_entries/new.html.erb".freeze, "app/views/spree/admin/users/_author_info_fields.html.erb".freeze, "app/views/spree/blog_entries/_blog_entries.html.erb".freeze, "app/views/spree/blog_entries/_blog_entry.html.erb".freeze, "app/views/spree/blog_entries/_blog_entry_details.html.erb".freeze, "app/views/spree/blog_entries/_blog_sidebar.html.erb".freeze, "app/views/spree/blog_entries/_categories_list.html.erb".freeze, "app/views/spree/blog_entries/_comments.html.erb".freeze, "app/views/spree/blog_entries/_news_archive.html.erb".freeze, "app/views/spree/blog_entries/_recent_blog_entries.html.erb".freeze, "app/views/spree/blog_entries/_tag_cloud.html.erb".freeze, "app/views/spree/blog_entries/archive.html.erb".freeze, "app/views/spree/blog_entries/author.html.erb".freeze, "app/views/spree/blog_entries/category.html.erb".freeze, "app/views/spree/blog_entries/feed.rss.builder".freeze, "app/views/spree/blog_entries/index.html.erb".freeze, "app/views/spree/blog_entries/show.html.erb".freeze, "app/views/spree/blog_entries/tag.html.erb".freeze, "bin/rails".freeze, "config/locales/en.yml".freeze, "config/locales/es.yml".freeze, "config/locales/ru.yml".freeze, "config/routes.rb".freeze, "db/migrate/20081004123517_create_blog_entries.rb".freeze, "db/migrate/20130128124852_acts_as_taggable_on_migration.rb".freeze, "db/migrate/20130216181713_add_visible_publishedat_and_summary_to_blog_entries.rb".freeze, "db/migrate/20130313213904_add_author_to_blog_entries.rb".freeze, "db/migrate/20130704034730_change_author_to_user_id_on_blog_entries.rb".freeze, "db/migrate/20130706015658_add_author_info_fields_to_users.rb".freeze, "db/migrate/20140901055150_add_missing_unique_indices.rb".freeze, "db/migrate/20140901055153_add_taggings_counter_cache_to_tags.rb".freeze, "db/migrate/20140901055154_add_missing_taggable_index.rb".freeze, "db/migrate/20140901055156_add_missing_indexes.rb".freeze, "lib/generators/solidus_campaigns/install/install_generator.rb".freeze, "lib/solidus_campaigns.rb".freeze, "lib/solidus_campaigns/engine.rb".freeze, "lib/solidus_campaigns/factories.rb".freeze, "lib/solidus_campaigns/solidus_campaigns_ability.rb".freeze, "screenshot.png".freeze, "solidus_campaigns.gemspec".freeze, "spec/models/spree/blog_entry_spec.rb".freeze, "spec/requests/admin/blog_entries_spec.rb".freeze, "spec/requests/admin/edit_user_spec.rb".freeze, "spec/requests/alternative_route_spec.rb".freeze, "spec/requests/blog_entries_spec.rb".freeze, "spec/requests/blog_widgets_spec.rb".freeze, "spec/requests/rss_feed_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/authentication_helpers.rb".freeze, "spec/support/image.png".freeze]
    s.homepage = "https://github.com/arielj/solidus_campaigns".freeze
    s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
    s.requirements = ["none".freeze]
    s.rubygems_version = "2.6.14".freeze
    s.summary = "SolidusCampaigns: A Solidus campaigns solution".freeze
    #s.test_files = ["spec/models/spree/blog_entry_spec.rb".freeze, "spec/requests/admin/blog_entries_spec.rb".freeze, "spec/requests/admin/edit_user_spec.rb".freeze, "spec/requests/alternative_route_spec.rb".freeze, "spec/requests/blog_entries_spec.rb".freeze, "spec/requests/blog_widgets_spec.rb".freeze, "spec/requests/rss_feed_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/authentication_helpers.rb".freeze, "spec/support/image.png".freeze]

    s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

    if s.respond_to? :specification_version then
      s.specification_version = 4

      if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
        s.add_runtime_dependency(%q<solidus>.freeze, ["> 1.0"])
        s.add_runtime_dependency(%q<deface>.freeze, ["~> 1"])
      else
        s.add_dependency(%q<solidus>.freeze, ["> 1.0"])
        s.add_dependency(%q<deface>.freeze, ["~> 1"])
      end
    else
      s.add_dependency(%q<solidus>.freeze, ["> 1.0"])
      s.add_dependency(%q<deface>.freeze, ["~> 1"])
    end
    s.add_dependency('papercrop')
  end
