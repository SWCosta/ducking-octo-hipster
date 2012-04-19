module DirectoriesHelper
  #TODO: make this work on the filesystem rather than the db
  def directory_naviation(name)
  end

  def directory_menu_items(name)
    split = name.split(/(?=\/)/)
    split.inject(items = []) do |res,item|
      res.push( { :path => if res.last.is_a?(Hash)
                             res.last[:path] + item
                           else
                             item[1..-1]
                           end,
                  :name => item } )
    end
    items.each{ |item| item[:name].sub!(/^\//,"") }
  end

  #def link_to_folder(dir)
  #  = "bla"
  #  = "blubb"
  #end
end
