/**
 * Main JavaScript file for Vinay Kawade's Blog
 * Handles navigation, animations, and interactive elements
 */

document.addEventListener('DOMContentLoaded', function() {
  // Mobile navigation toggle
  const navToggle = document.querySelector('.nav-toggle');
  const mainNav = document.querySelector('.main-nav');
  
  if (navToggle) {
    navToggle.addEventListener('click', function() {
      mainNav.classList.toggle('open');
      
      // Animate hamburger icon
      const spans = this.querySelectorAll('span');
      spans.forEach(span => span.classList.toggle('active'));
    });
  }
  
  // Highlight active navigation item based on current page
  const currentPage = window.location.pathname.split('/').pop();
  const navLinks = document.querySelectorAll('.main-nav a');
  
  navLinks.forEach(link => {
    const linkPage = link.getAttribute('href');
    if (linkPage === currentPage || 
        (currentPage === '' && linkPage === 'index.html') || 
        (currentPage === '/' && linkPage === 'index.html')) {
      link.classList.add('active');
    }
  });
  
  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      e.preventDefault();
      
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;
      
      const targetElement = document.querySelector(targetId);
      if (targetElement) {
        window.scrollTo({
          top: targetElement.offsetTop - 80, // Offset for fixed header
          behavior: 'smooth'
        });
      }
    });
  });
  
  // Lazy load images
  if ('IntersectionObserver' in window) {
    const lazyImages = document.querySelectorAll('img[data-src]');
    
    const imageObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src;
          img.removeAttribute('data-src');
          imageObserver.unobserve(img);
        }
      });
    });
    
    lazyImages.forEach(img => {
      imageObserver.observe(img);
    });
  } else {
    // Fallback for browsers without IntersectionObserver support
    const lazyImages = document.querySelectorAll('img[data-src]');
    lazyImages.forEach(img => {
      img.src = img.dataset.src;
      img.removeAttribute('data-src');
    });
  }
  
  // Add animation classes to elements as they scroll into view
  if ('IntersectionObserver' in window) {
    const animatedElements = document.querySelectorAll('.animate-on-scroll');
    
    const animationObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('fade-in');
          animationObserver.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.1
    });
    
    animatedElements.forEach(element => {
      animationObserver.observe(element);
    });
  }
  
  // Back to top button
  const backToTopButton = document.querySelector('.back-to-top');
  
  if (backToTopButton) {
    window.addEventListener('scroll', () => {
      if (window.pageYOffset > 300) {
        backToTopButton.classList.add('show');
      } else {
        backToTopButton.classList.remove('show');
      }
    });
    
    backToTopButton.addEventListener('click', e => {
      e.preventDefault();
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  }
});