class UserPresenter < BasePresenter
  presents :user

  def email
    user.email
  end

  def approved_label
    if user.approved 
      bootstrap_label("ja","success") 
    else 
      link_to bootstrap_label("nein","important"), edit_user_path(user, :transition => "activate", :page => params[:page])
    end
  end

end
