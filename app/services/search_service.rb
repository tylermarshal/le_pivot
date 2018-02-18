class SearchService
  include ActiveModel::Serialization

  attr_reader :type, :q

  def initialize(params)
    @q = params[:q]
    @type = params[:type]
  end

  def results
    if type == "items"
      Item.item_search(q)
    end
  end
end
