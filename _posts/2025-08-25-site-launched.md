---
layout: scientific-post
title: "I launched the site!"
date: 2025-08-25
categories: [tutorial]
tags: [jekyll, github-pages, blog-setup]
summary: "A quick overview of setting up this Jekyll-powered scientific blog and what to expect from future content."
reading_time: 2
keywords: [jekyll, blog, github-pages, scientific-writing]
---

## Welcome to My Scientific Blog

Well, I finally got around to putting this website together! It's quite neat - powered by [Jekyll](http://jekyllrb.com) and I can use Markdown to author my posts. It actually turned out to be a lot easier than I thought it was going to be.

## What You Can Expect

This blog will focus on:

- **Biochemistry research** - particularly my work on carbon monoxide dehydrogenases
- **Bioinformatics tutorials** - sharing useful computational methods
- **Data analysis** - reproducible research with R and Python
- **Scientific computing** - tools and techniques for biological research

## Technical Setup

The blog uses Jekyll with GitHub Pages for automatic deployment. Key features include:

- **MathJax support** for equations like $K_m = \frac{[S]}{2}$ when $v = \frac{V_{max}}{2}$
- **Syntax highlighting** for code blocks
- **Dark/light mode** toggle for comfortable reading
- **Responsive design** that works on all devices
- **Scientific post layout** with proper metadata and structure

### Example Code

Here's a simple R example for future reference:

```r
# Load required libraries
library(ggplot2)
library(dplyr)

# Create sample enzyme kinetics data
km_data <- data.frame(
  substrate_conc = c(0.1, 0.2, 0.5, 1.0, 2.0, 5.0),
  reaction_rate = c(0.8, 1.4, 2.7, 4.0, 5.7, 7.9)
)

# Plot Michaelis-Menten curve
ggplot(km_data, aes(x = substrate_conc, y = reaction_rate)) +
  geom_point() +
  geom_smooth(method = "nls", 
              formula = y ~ Vmax * x / (Km + x),
              method.args = list(start = c(Vmax = 10, Km = 1))) +
  labs(x = "Substrate Concentration (mM)", 
       y = "Reaction Rate (μmol/min)")
```

## Acknowledgments

Thanks to [Hank Quinlan](https://jmcglone.com/guides/github-pages/) for the excellent GitHub Pages tutorial that got me started!
