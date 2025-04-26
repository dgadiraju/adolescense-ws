document.addEventListener('DOMContentLoaded', () => {
    // Add header scroll effect
    const header = document.querySelector('header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.style.backgroundColor = 'rgba(26, 26, 26, 0.95)';
            header.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.2)';
        } else {
            header.style.backgroundColor = 'rgba(26, 26, 26, 0.9)';
            header.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
        }
    });

    // Add smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Add mobile navigation toggle functionality if needed
    const mobileBreakpoint = 768;
    
    // Function to initialize lightbox for gallery if it exists
    if (document.querySelector('.gallery-grid')) {
        initLightbox();
    }
});

// Initialize lightbox functionality for gallery page
function initLightbox() {
    const galleryItems = document.querySelectorAll('.gallery-item img');
    
    galleryItems.forEach(item => {
        item.addEventListener('click', () => {
            // Create lightbox elements
            const lightbox = document.createElement('div');
            lightbox.classList.add('lightbox');
            
            const lightboxImg = document.createElement('img');
            lightboxImg.src = item.src;
            
            const closeBtn = document.createElement('span');
            closeBtn.classList.add('lightbox-close');
            closeBtn.innerHTML = '&times;';
            
            // Add elements to DOM
            lightbox.appendChild(closeBtn);
            lightbox.appendChild(lightboxImg);
            document.body.appendChild(lightbox);
            
            // Prevent body scrolling when lightbox is open
            document.body.style.overflow = 'hidden';
            
            // Close lightbox on click
            lightbox.addEventListener('click', () => {
                document.body.removeChild(lightbox);
                document.body.style.overflow = 'auto';
            });
        });
    });
} 