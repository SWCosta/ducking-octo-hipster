class DirectoryPresenter < NodePresenter
  def icon
    @template.icon("folder-close")
  end

  def link
    directory_path(node.fullname.slice(1..-1))
  end
end

