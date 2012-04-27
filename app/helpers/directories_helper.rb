module DirectoriesHelper
  #TODO: make this work on the filesystem rather than the db
  def directory_naviation(name)
  end

  def directory_menu_items(fullname)
    split = fullname.split(/\//)
    split = (split.size == 0 ? [""] : split)
    e = Enumerator.new do |y|
      split.size.times do |i|
        y << split.take(i+1)
      end
    end
    e.inject([]) do |res,item|
      res.push( { :name => (item.last.present? ? item.last : "Home"),
                  :path => item.reject{ |i| i == ""}.join("/") } )
    end
  end
end
