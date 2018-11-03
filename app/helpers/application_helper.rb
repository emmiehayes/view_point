module ApplicationHelper

  def embed(youtube_url)
    content_tag(:iframe, nil, src: "#{youtube_url}")
  end
end
