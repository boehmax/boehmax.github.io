#!/bin/bash

# Development script for Jekyll blog
# This script provides common development tasks

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Jekyll Blog Development Script${NC}"
    echo -e "${BLUE}================================${NC}"
    echo
}

print_usage() {
    echo -e "${YELLOW}Usage:${NC}"
    echo "  $0 serve       - Start development server"
    echo "  $0 build       - Build the site"
    echo "  $0 new [title] - Create a new post"
    echo "  $0 draft [title] - Create a new draft"
    echo "  $0 publish [file] - Move draft to posts"
    echo "  $0 clean       - Clean build files"
    echo "  $0 help        - Show this help"
    echo
}

serve_site() {
    echo -e "${GREEN}Starting Jekyll development server...${NC}"
    cd "$PROJECT_DIR"
    export PATH="/home/runner/.local/share/gem/ruby/3.2.0/bin:$PATH"
    jekyll serve --drafts --livereload --host 0.0.0.0 --port 4000
}

build_site() {
    echo -e "${GREEN}Building Jekyll site...${NC}"
    cd "$PROJECT_DIR"
    export PATH="/home/runner/.local/share/gem/ruby/3.2.0/bin:$PATH"
    jekyll build
    echo -e "${GREEN}Site built successfully!${NC}"
}

new_post() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: Please provide a title for the post${NC}"
        echo "Usage: $0 new \"Your Post Title\""
        exit 1
    fi
    
    cd "$PROJECT_DIR"
    ruby _scripts/new_post.rb "$1"
}

new_draft() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: Please provide a title for the draft${NC}"
        echo "Usage: $0 draft \"Your Draft Title\""
        exit 1
    fi
    
    cd "$PROJECT_DIR"
    ruby _scripts/new_post.rb "$1" --draft
}

publish_draft() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: Please provide the draft filename${NC}"
        echo "Usage: $0 publish draft_filename.md"
        exit 1
    fi
    
    draft_file="$PROJECT_DIR/_drafts/$1"
    
    if [ ! -f "$draft_file" ]; then
        echo -e "${RED}Error: Draft file not found: $draft_file${NC}"
        exit 1
    fi
    
    # Add current date to filename
    date_prefix=$(date +%Y-%m-%d)
    new_filename="$date_prefix-$(basename "$1")"
    
    # Move to posts directory
    mv "$draft_file" "$PROJECT_DIR/_posts/$new_filename"
    
    # Update the date in front matter
    sed -i "s/^date:.*/date: $(date +%Y-%m-%d)/" "$PROJECT_DIR/_posts/$new_filename"
    
    echo -e "${GREEN}Published draft as: _posts/$new_filename${NC}"
}

clean_site() {
    echo -e "${YELLOW}Cleaning build files...${NC}"
    cd "$PROJECT_DIR"
    rm -rf _site .jekyll-cache .sass-cache
    echo -e "${GREEN}Clean complete!${NC}"
}

# Main script logic
case "$1" in
    "serve")
        print_header
        serve_site
        ;;
    "build")
        print_header
        build_site
        ;;
    "new")
        print_header
        new_post "$2"
        ;;
    "draft")
        print_header
        new_draft "$2"
        ;;
    "publish")
        print_header
        publish_draft "$2"
        ;;
    "clean")
        print_header
        clean_site
        ;;
    "help"|"")
        print_header
        print_usage
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        print_usage
        exit 1
        ;;
esac