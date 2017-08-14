class CustomBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.render "/common/breadcrumbs", elements: @elements
  end
end
