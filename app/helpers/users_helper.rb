module UsersHelper

  def simple_website_link(url)
    url.gsub(/(http|https):\/\//,'')
  end

  def simple_linkedin_link(url)
    last = url.split('/').last
    "linkedin.com/in/#{last}"
  end

end
