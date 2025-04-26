#!/bin/bash

# Adolescence Fan Page Update Script
# This script helps with common updates to the fan page

echo "Adolescence Fan Page Update Script"
echo "=================================="
echo ""

# Functions
optimize_images() {
    echo "Optimizing images..."
    
    # Check if the image optimization tools are installed
    if command -v cwebp &> /dev/null; then
        # Convert jpeg/jpg/png files to webp if not already converted
        find assets/images -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read file; do
            webp_file="${file%.*}.webp"
            if [ ! -f "$webp_file" ]; then
                echo "Converting $file to WebP format..."
                cwebp -q 80 "$file" -o "$webp_file"
            fi
        done
        echo "WebP conversion complete."
    else
        echo "cwebp not found. Please install WebP tools to optimize images."
        echo "On macOS: brew install webp"
        echo "On Ubuntu: sudo apt-get install webp"
    fi
}

deploy_github() {
    echo "Preparing for GitHub Pages deployment..."
    
    # Check if git is initialized
    if [ ! -d ".git" ]; then
        echo "Git repository not initialized. Initializing..."
        git init
        git add .
        git commit -m "Initial commit"
        echo ""
        echo "Please set up your GitHub repository with the following commands:"
        echo "git remote add origin <your-github-repo-url>"
        echo "git push -u origin main"
    else
        echo "Committing changes..."
        git add .
        read -p "Enter commit message: " commit_message
        git commit -m "$commit_message"
        echo "Pushing to GitHub..."
        git push
        echo "Changes pushed to GitHub. Your site should update shortly."
    fi
}

# Main menu
while true; do
    echo "What would you like to do?"
    echo "1. Optimize images (convert to WebP)"
    echo "2. Deploy to GitHub Pages"
    echo "3. Exit"
    read -p "Enter your choice (1-3): " choice
    
    case $choice in
        1)
            optimize_images
            ;;
        2)
            deploy_github
            ;;
        3)
            echo "Exiting script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    
    echo ""
done 