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

  def show_first_link?
  	@scope.total_pages > 1 && !scope.first_page?
  end

  def show_previous_link?
  	!@scope.first_page?
  end

  def show_next_link?
  	!@scope.last_page?
  end

  def show_last_link?
  	@scope.total_pages > 1 && !@scope.last_page?
  end

  def pages
  	@pages ||= {}.tap do |h|
  		h[:first] = 1 if show_first_link?
  		h[:prev] = @scope.current_page - 1 if show_previous_link?
  		h[:next] = @scope.current_page + 1 if show_next_link?
  		h[:last] = @scope.total_pages if show_last_link?
  	end
  end

  def links
  	@links ||= pages.each_with_object([]) do |(k,v), links|
  		query_params = @query_params.merge({ 'page' => v, 'per' => @per }).to_param
  		links << "<#{@url}?#{query_params}>; rel=\"#{k}\""
  	end.join(', ')
  end

end
