module ApplicationHelper

  def menu_items
    [{
      name: 'My Feed',
      path: root_path,
    }, {
      name: 'Topics',
      path: topics_path,
    }, {
      name: 'Users',
      path: smarties_path,
    }, {
      name: 'Post',
      path: posts_path,
    }, {
      name: 'About',
      path: about_path,
    }, {
      name: 'Contact',
      path: contact_path,
    }, {
      name: 'Privacy',
      path: privacy_path,
    },].map do |item|
      {
        name: item[:name],
        path: item[:path],
        active: current_page?(item[:path])
      }
    end
  end

  def follow_buttons(user_to_follow: user, logged_in_user: current_user)
    if logged_in_user
      if current_user.following.any? && current_user.following_ids.include?(user_to_follow.id)
        link_to 'Following', follow_toggle_path(user_to_follow.id), class: 'unfollow-link btn btn-unfollow btn-block', remote: true
      else
        link_to 'Follow', follow_toggle_path(user_to_follow.id), class: 'follow-link btn btn-default btn-block', remote: true
      end
    else
      link_to 'Sign Up to Follow', new_user_registration_path, class: 'btn btn-primary'
    end
  end

end
