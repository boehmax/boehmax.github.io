# Blog Maintenance Guide

This guide will help you easily maintain and add content to your minimalistic scientific blog.

## Quick Start

### Creating a New Blog Post

1. Copy the template from `_templates/scientific-post-template.md`
2. Rename it following the pattern: `YYYY-MM-DD-your-post-title.md`
3. Place it in the `_posts` folder
4. Edit the front matter (metadata at the top)
5. Write your content in Markdown

### Example Post Creation

```bash
# Copy template to create new post
cp _templates/scientific-post-template.md _posts/2024-01-15-protein-analysis.md
```

## Front Matter Options

The metadata at the top of each post controls how it appears:

```yaml
---
layout: scientific-post          # Use this layout for research posts
title: "Your Post Title"         # Required: Post title
date: 2024-01-15                # Required: Publication date
categories: [research, tutorial] # Groups posts by type
tags: [biochemistry, python]     # Searchable keywords
summary: "Brief description"     # Appears in blog listing
reading_time: 5                 # Estimated minutes to read
keywords: [protein, analysis]    # SEO keywords
references:                     # Optional: Citations
  - "Author, A. (2023). Paper title. Journal, 1(1), 1-10."
data_availability: "GitHub link" # Optional: Where to find data/code
---
```

### Category Options
- `research` - Original research findings
- `tutorial` - How-to guides and methods
- `analysis` - Data analysis and results
- `review` - Literature reviews and summaries
- `methods` - Methodological developments

### Common Tags
- `biochemistry`, `bioinformatics`, `protein-structure`
- `data-analysis`, `visualization`, `statistics`
- `python`, `r`, `computational-biology`
- `enzymes`, `evolution`, `carbon-monoxide-dehydrogenase`

## Writing Scientific Content

### Mathematical Equations

**Inline math:** `$E = mc^2$` renders as $E = mc^2$

**Display math:**
```latex
$$
\frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right)
$$
```

### Code Blocks

Use language-specific syntax highlighting:

````markdown
```r
# R code
library(ggplot2)
ggplot(data, aes(x, y)) + geom_point()
```

```python
# Python code
import matplotlib.pyplot as plt
plt.scatter(x, y)
```

```bash
# Shell commands
grep "pattern" file.txt | sort | uniq
```
````

### Tables

```markdown
| Protein | MW (kDa) | Organism |
|---------|----------|----------|
| CODH-I  | 66       | *C. hydrogenoformans* |
| CODH-II | 72       | *M. thermoacetica* |
```

### Citations and References

Add references in the front matter:

```yaml
references:
  - "Smith, J. et al. (2023). CO dehydrogenase structure. Nature, 500(1), 123-130."
  - "Jones, A. (2022). Enzyme kinetics analysis. Science, 350(2), 45-52."
```

## File Structure

```
├── _config.yml              # Site configuration
├── _layouts/
│   ├── default.html         # Main page layout
│   ├── post.html           # Simple post layout
│   └── scientific-post.html # Enhanced scientific post layout
├── _posts/                  # Your blog posts go here
├── _templates/             # Templates for new posts
├── about/                  # About page
├── apps/                   # Shiny apps showcase
├── blog/                   # Blog listing page
├── css/main.css            # All styling
└── index.html              # Homepage
```

## Customization

### Adding New Navigation Items

Edit `_layouts/default.html` in the navigation section:

```html
<nav>
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/apps">Apps</a></li>
        <li><a href="/blog">Blog</a></li>
        <!-- Add new items here -->
    </ul>
</nav>
```

### Modifying Colors and Styling

Edit CSS variables in `css/main.css`:

```css
:root {
    --bg-color: #ffffff;
    --text-color: #333333;
    --accent-color: #2b6cb0;
    /* Modify these for different colors */
}
```

### Adding Shiny Apps

Edit `_data/shiny_apps.yml` to add new applications.

## Best Practices

### Content Organization

1. **Use descriptive titles** that clearly indicate the content
2. **Write good summaries** for the blog listing page
3. **Tag consistently** to help readers find related content
4. **Estimate reading time** to help readers plan
5. **Include data availability** when sharing analysis

### Writing Style

1. **Start with context** - briefly explain the background
2. **Use clear headings** to structure your content
3. **Include visual elements** - tables, equations, code examples
4. **End with implications** - what does this mean for the field?

### Scientific Integrity

1. **Cite sources** properly in the references section
2. **Share code and data** when possible
3. **Be transparent** about methods and limitations
4. **Use proper scientific language** but keep it accessible

## Deployment

Your blog automatically deploys via GitHub Pages when you push changes to the main branch. Changes typically appear within a few minutes.

## Troubleshooting

### Common Issues

1. **Post not appearing**: Check filename format (`YYYY-MM-DD-title.md`)
2. **Formatting broken**: Verify YAML front matter syntax
3. **Math not rendering**: Ensure MathJax syntax is correct
4. **Code not highlighted**: Check language identifier in code blocks

### Getting Help

- Check [Jekyll documentation](https://jekyllrb.com/docs/)
- Review [Markdown guide](https://www.markdownguide.org/)
- Contact via GitHub issues or email

---

*Last updated: {{ site.time | date: "%Y-%m-%d" }}*