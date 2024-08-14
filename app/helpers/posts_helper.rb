module PostsHelper
  def sanitize_with_whitelist(html)
    return '' unless html

    transformer = lambda do |env|
      if env[:node].element? &&
        env[:node_name] == 'script' &&
        (node_src(env).start_with?("https://gist.github.com/") || node_src(env).start_with?("https://static.codepen.io/assets/embed/ei.js")) &&
        env[:node].text == '' &&
        env[:node].children.empty?
        {node_whitelist: [env[:node]]}
      end
    end

    cleaned_html = Sanitize.fragment(
      html,
      :elements => [
        'header',
        'span',
        'strong',
        'p',
        'h1', 'h2', 'h3', 'h4',
        'img',
        'tt',
        'br',
        'em',
        'u',
        'div'
      ],
      :attributes => {
        'a'    => ['href', 'title', 'class'],
        'span' => ['class'],
        'p'    => ['class'],
        'img'  => ['src', 'class', 'alt', 'style'],
        'div'  => ['class', 'style']
      },
     :transformers => transformer
    )

    cleaned_html
  end

  def auto_link(post_content)
    post_content.gsub(/@\w+/) { |mention| link_to mention, profile_path(mention[1..-1]) }
  end

  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
# portfolio_item.thumb_image.attached?
  def portfolio_img model
    if model.main_image.attached? && type == 'main'
      model.main_image
    elsif model.thumb_image.attached? && type == 'thumb'
      model.thumb_image
    elsif type == 'thumb'
      image_generator(height: '328', width: '82')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end  

  def post_img(post)
    if post.img.attached?
      image_tag(post.img)
    else
      image_tag(image_generator(height: '328', width: '82'))
    end
  end  
end
