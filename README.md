# Maximilian Böhm's Science Blog

A Jekyll-powered blog for sharing insights on biochemistry, data science, and scientific research.

## 🚀 Quick Start

### Creating New Posts

The easiest way to create new blog posts:

```bash
# Create a new post
./_scripts/dev.sh new "Your Amazing Discovery"

# Create a draft (won't be published)
./_scripts/dev.sh draft "Work in Progress"

# Publish a draft
./_scripts/dev.sh publish draft-filename.md
```

### Development Server

```bash
# Start the development server with live reload
./_scripts/dev.sh serve

# Build the site
./_scripts/dev.sh build

# Clean build files
./_scripts/dev.sh clean
```

### Manual Post Creation

Posts go in the `_posts` directory with the filename format: `YYYY-MM-DD-title.md`

Example front matter:
```yaml
---
layout: post
title: "Your Post Title"
date: 2024-01-15
categories: [science, data]
tags: [biochemistry, analysis]
excerpt: "A brief description of your post..."
math: true  # Enable MathJax for equations
---
```

## 📁 Directory Structure

```
├── _posts/          # Published blog posts
├── _drafts/         # Draft posts (not published)
├── _layouts/        # Page templates
├── _data/           # Data files (CV, apps)
├── _scripts/        # Development helper scripts
├── assets/          # Images, downloads, etc.
│   ├── images/
│   │   ├── posts/   # Post images
│   │   ├── profile/ # Profile pictures
│   │   └── apps/    # App screenshots
│   ├── js/          # JavaScript files
│   └── downloads/   # Downloadable files
├── css/             # Stylesheets
├── about/           # About page
├── apps/            # Shiny apps showcase
└── blog/            # Blog listing page
```

## ✍️ Writing Guidelines

### Scientific Content
- Use MathJax for equations: `$E = mc^2$` or `$$\int_0^\infty e^{-x} dx$$`
- Add code blocks with syntax highlighting
- Include figures with proper captions
- Use proper scientific referencing

### Markdown Features
- **Bold text** and *italic text*
- [Links](https://example.com)
- `inline code`
- > Blockquotes for important notes
- Tables for data presentation
- Lists for organizing information

### Images
- Place images in `assets/images/posts/`
- Use relative paths: `![Description](/assets/images/posts/your-image.jpg)`
- Add alt text for accessibility

### Code Blocks
```python
def analyze_data(dataset):
    """Analyze biochemical data."""
    return processed_data
```

## 🎨 Customization

### Colors and Themes
The site supports automatic dark/light mode based on system preferences. Colors are defined in CSS variables in `css/main.css`.

### Adding New Pages
1. Create a new HTML file in the root directory
2. Add Jekyll front matter
3. Use `layout: default`
4. Update navigation in `_layouts/default.html`

### Apps Section
Add new Shiny apps to `_data/shiny_apps.yml`:

```yaml
- title: "App Name"
  description: "App description"
  url: "https://your-app-url.com"
  image: "/assets/images/apps/app-screenshot.jpg"
  tags: ["R", "Shiny", "Analysis"]
  featured: true
```

### Resources Section
Add new learning resources to `_data/resources.yml`:

```yaml
- title: "Resource Title"
  author: "Author Name"
  url: "https://resource-url.com"
  description: "Brief description of the resource and why it's valuable."
  type: "book"  # book, video, paper, course, tool, website
  topic: "biochemistry"  # biochemistry, bioinformatics, data-science, statistics, programming, general
  year: 2023  # optional
  blog_post: "/blog/2023/01/01/resource-review-title"  # optional - link to detailed review
```

Resources are automatically organized by topic and type with dual filtering functionality.

## 🛠️ Technical Details

### Built With
- Jekyll (Static Site Generator)
- GitHub Pages (Hosting)
- MathJax (Mathematical equations)
- Highlight.js (Syntax highlighting)
- CSS Grid & Flexbox (Responsive layout)

### Browser Support
- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile responsive
- Dark/light mode support

## 📧 Contact

Questions about the blog or suggestions for improvements?
- Email: [boehmax97@gmail.com](mailto:boehmax97@gmail.com)
- GitHub: [github.com/boehmax](https://github.com/boehmax)

---

*Keep sharing science! 🧬📊*