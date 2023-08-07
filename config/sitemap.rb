# frozen_string_literal: true

Sitemap::Generator.instance.load(host: 'scholarspace.library.gwu.edu', protocol: 'https') do
  path :root, priority: 1, change_frequency: 'weekly'
  path :search_catalog, priority: 1, change_frequency: 'weekly'

  read_group = ActiveFedora.index_field_mapper.solr_name('read_access_group', :symbol)
  GwWork.where(read_group => 'public').each do |f|
    literal Rails.application.routes.url_helpers.hyrax_gw_work_path(f, action: 'show'),
            priority: 1, change_frequency: 'weekly'
  end
  GwEtd.where(read_group => 'public').each do |f|
    literal Rails.application.routes.url_helpers.hyrax_gw_etd_path(f, action: 'show'),
            priority: 1, change_frequency: 'weekly'
  end
end
