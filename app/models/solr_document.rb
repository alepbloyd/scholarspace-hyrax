# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  include BlacklightOaiProvider::SolrDocument

  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds Hyrax behaviors to the SolrDocument.
  include Hyrax::SolrDocumentBehavior


  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  # Do content negotiation for AF models. 

  use_extension( Hydra::ContentNegotiation )

  field_semantics.merge!(
    title: Solrizer.solr_name('title'),
    creator: Solrizer.solr_name('creator'),
    description: Solrizer.solr_name('description'),
    publisher: Solrizer.solr_name('publisher'),
    identifier: Solrizer.solr_name('doi'),
    subject: Solrizer.solr_name('keyword')
  )

  def gw_affiliation
    self[Solrizer.solr_name('gw_affiliation')]
  end

  def doi
    self[Solrizer.solr_name('doi')]
  end

  def degree
    self[Solrizer.solr_name('degree')]
  end

  def advisor
    self[Solrizer.solr_name('advisor')]
  end

  def committee_member
    self[Solrizer.solr_name('committee_member')]
  end

  def volume
    self[Solrizer.solr_name('volume')]
  end

  def issue
    self[Solrizer.solr_name('issue')]
  end
end
