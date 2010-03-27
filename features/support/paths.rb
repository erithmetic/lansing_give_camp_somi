module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    when /the signup page/
      '/users/new'
    when /the sign-in page/
      '/sessions/new'
    when /the sign-out page/
      '/sign-out'
    when /the password reset email page/
      '/password_resets/new'
    else
      if page_name =~ /^\//
        page_name
      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
