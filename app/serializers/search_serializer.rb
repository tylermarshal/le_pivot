class SearchSerializer < ActiveModel::Serializer
  attributes :type, :q, :results

  has_many :results
end
