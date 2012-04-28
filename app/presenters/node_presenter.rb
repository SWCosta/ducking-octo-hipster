class NodePresenter < BasePresenter
  presents :node

  def handle
    link_to icon + name, link
  end

  def name
    node.name
  end

  def icon
    @template.icon("close")
  end

  def size
    ""
  end

  def extension
    ""
  end
end
