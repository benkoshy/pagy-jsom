module Paginable
    extend ActiveSupport::Concern
    
    def paginator
      JSOM::Pagination::Paginator.new
    end
    
    def pagination_params
      params.permit![:page] # defaults to 20 pages 
    end
    
    def paginate(collection)
      paginator.call(collection, params: pagination_params, base_url: request.url)
    end
  
    def render_collection(paginated)
      options = {
        # meta: paginated.meta.to_h, # Will get total pages, total count, etc.
        links: paginated.links.to_h
      }

      ## Ideally we want to use a seralizer
      # paginated_result = serializer.new(paginated.items, options)

      # but we will settle for a poor man's serializer. The JSON may not be correct
      paginated_result = {data: paginated.items, links: paginated.links.to_h}.as_json
  
      render json: paginated_result
    end
end