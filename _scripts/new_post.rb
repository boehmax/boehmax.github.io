#!/usr/bin/env ruby

require 'date'
require 'fileutils'

# Script to create a new blog post with proper Jekyll front matter
class NewPost
  def initialize
    @posts_dir = File.join(File.dirname(__FILE__), '..', '_posts')
    @drafts_dir = File.join(File.dirname(__FILE__), '..', '_drafts')
    
    # Ensure directories exist
    FileUtils.mkdir_p(@posts_dir)
    FileUtils.mkdir_p(@drafts_dir)
  end

  def create_post(title, is_draft = false)
    slug = title.downcase.gsub(/[^a-z0-9\s-]/, '').gsub(/\s+/, '-')
    date = Date.today
    filename = "#{date}-#{slug}.md"
    
    target_dir = is_draft ? @drafts_dir : @posts_dir
    filepath = File.join(target_dir, filename)
    
    if File.exist?(filepath)
      puts "Error: Post already exists at #{filepath}"
      return false
    end

    front_matter = generate_front_matter(title, date, is_draft)
    
    File.write(filepath, front_matter)
    puts "Created new #{is_draft ? 'draft' : 'post'}: #{filepath}"
    puts "Edit the file to add your content!"
    
    true
  end

  private

  def generate_front_matter(title, date, is_draft)
    content = <<~FRONTMATTER
      ---
      layout: post
      title: "#{title}"
      date: #{date}
      categories: [science, data]
      tags: []
      excerpt: "Add a brief excerpt here..."
      # featured_image: "/assets/images/posts/your-image.jpg"
      # math: true  # Enable if you need MathJax
      ---

      Write your post content here...

      ## Introduction

      Start with an engaging introduction to your topic.

      ## Main Content

      Add your main content here. You can use:

      - **Bold text** and *italic text*
      - [Links](https://example.com)
      - `inline code` and code blocks
      - Mathematical equations with MathJax: $E = mc^2$

      ```python
      # Code blocks with syntax highlighting
      def hello_world():
          print("Hello, World!")
      ```

      ## Conclusion

      Wrap up your thoughts here.

      ---

      *What did you think of this post? Feel free to reach out via [email](mailto:boehmax97@gmail.com) or [GitHub](https://github.com/boehmax)!*
    FRONTMATTER
    
    content
  end
end

# Command line interface
if __FILE__ == $0
  if ARGV.empty?
    puts "Usage: ruby new_post.rb \"Your Post Title\" [--draft]"
    puts "Example: ruby new_post.rb \"My Amazing Discovery\""
    puts "Example: ruby new_post.rb \"Work in Progress\" --draft"
    exit 1
  end

  title = ARGV[0]
  is_draft = ARGV.include?('--draft')
  
  post_creator = NewPost.new
  post_creator.create_post(title, is_draft)
end