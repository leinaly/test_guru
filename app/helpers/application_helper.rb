module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to("TestGuru Project", "https://github.com/#{author}/#{repo}", target: :_blank)
  end

  def flash_messages(flash, style_class = 'flash alert')
    flash.map do |key, message|
      content_tag :div, message, id: key, class: style_class
    end.join.html_safe
  end

end

