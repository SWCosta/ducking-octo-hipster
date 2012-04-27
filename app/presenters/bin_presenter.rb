class BinPresenter < NodePresenter
  def name
    node.name
  end

  def icon
    @template.icon("file")
  end

  def link
    "link_zum_runterladen"
  end
end

