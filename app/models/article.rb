require 'elasticsearch/model'
class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
     mappings dynamic: 'false' do
       indexes :title
     end
  end


end
# 
# # Delete the previous articles index in Elasticsearch
# Article.__elasticsearch__.client.indices.delete \\
#   index: Article.title rescue nil
# # Create the new index with the new mapping
# Article.__elasticsearch__.client.indices.create \\
#   index: Article.title,
#   body: { settings: Article.settings.to_hash, mappings: Article.mappings.to_hash }
# # Index all article records from the DB to Elasticsearch
# Article.import force: true
