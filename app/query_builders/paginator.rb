class Paginator
  def initialize(scope, params, url)
  	@query_params = params
  	@page = @query_params['page'] || 1
  	@per = @query_params['per'] || 10
  	@scope = scope
  	@url = url
  end
  def paginate
  	@scope.page(@page).per(@per)
  end
end
