#!/usr/bin/env python3
"""
Script to create a new blog post with proper Jekyll front matter.
Python replacement for new_post.rb
"""

import os
import sys
import re
from datetime import date
from pathlib import Path
import argparse


class NewPost:
    def __init__(self):
        """Initialize the post creator with directory paths."""
        script_dir = Path(__file__).parent
        self.project_dir = script_dir.parent
        self.posts_dir = self.project_dir / '_posts'
        self.drafts_dir = self.project_dir / '_drafts'
        
        # Ensure directories exist
        self.posts_dir.mkdir(exist_ok=True)
        self.drafts_dir.mkdir(exist_ok=True)

    def create_post(self, title, is_draft=False):
        """
        Create a new blog post or draft.
        
        Args:
            title (str): The title of the post
            is_draft (bool): Whether to create a draft or published post
            
        Returns:
            bool: True if successful, False otherwise
        """
        # Generate slug from title
        slug = self._generate_slug(title)
        post_date = date.today()
        filename = f"{post_date}-{slug}.md"
        
        # Choose target directory
        target_dir = self.drafts_dir if is_draft else self.posts_dir
        filepath = target_dir / filename
        
        # Check if file already exists
        if filepath.exists():
            print(f"Error: Post already exists at {filepath}")
            return False

        # Generate front matter content
        front_matter = self._generate_front_matter(title, post_date, is_draft)
        
        # Write the file
        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(front_matter)
            
            post_type = 'draft' if is_draft else 'post'
            print(f"Created new {post_type}: {filepath}")
            print("Edit the file to add your content!")
            return True
            
        except Exception as e:
            print(f"Error creating post: {e}")
            return False

    def _generate_slug(self, title):
        """
        Generate a URL-friendly slug from the title.
        
        Args:
            title (str): The post title
            
        Returns:
            str: URL-friendly slug
        """
        # Convert to lowercase and replace non-alphanumeric characters
        slug = title.lower()
        slug = re.sub(r'[^a-z0-9\s-]', '', slug)
        slug = re.sub(r'\s+', '-', slug)
        slug = slug.strip('-')
        return slug

    def _generate_front_matter(self, title, post_date, is_draft):
        """
        Generate Jekyll front matter for the post.
        
        Args:
            title (str): Post title
            post_date (date): Publication date
            is_draft (bool): Whether this is a draft
            
        Returns:
            str: Complete post content with front matter
        """
        content = f"""---
layout: post
title: "{title}"
date: {post_date}
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
"""
        return content


def main():
    """Main function to handle command line interface."""
    parser = argparse.ArgumentParser(
        description='Create a new Jekyll blog post',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s "My Amazing Discovery"
  %(prog)s "Work in Progress" --draft
        """
    )
    parser.add_argument('title', help='The title of the post')
    parser.add_argument('--draft', action='store_true', 
                       help='Create a draft instead of a published post')
    
    args = parser.parse_args()
    
    if not args.title.strip():
        print("Error: Please provide a non-empty title for the post")
        return 1
    
    post_creator = NewPost()
    success = post_creator.create_post(args.title, args.draft)
    
    return 0 if success else 1


if __name__ == '__main__':
    sys.exit(main())