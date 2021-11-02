module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #


  def path_to(page_name)
    case page_name

    when /^the (LionMart)?home\s?page$/ then '/posts'
    when /^the create new post page$/ then '/posts/new'

    when /^the edit page for "(.*)"$/
      edit_post_path(Post.find_by_title($1))

    when /^the details page for "(.*)"$/
      post_path(Post.find_by_title($1))

    # when /^the Similar Movies page for "(.*)"$/
    #   similar_posts_path(Post.find_by_title($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)