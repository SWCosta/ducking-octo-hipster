class BinPresenter < NodePresenter
  def name
    node.name.truncate(50)
  end

  def icon
    @template.icon("file")
  end

  def link
    "link_zum_runterladen"
  end

  def size
    convert_size(node.size)
  end

  def extension
    node.extension
  end

  private

  def convert_size(byte)
    ((kibibyte = byte / 1024) > 0) ? (((mibibyte = kibibyte / 1024) > 0) ? "#{mibibyte} MiB" : "#{kibibyte} kiB" ) : "#{byte} B"
  end
end

