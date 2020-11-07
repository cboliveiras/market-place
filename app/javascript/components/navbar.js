const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-home');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-home-scrolled');
      } else {
        navbar.classList.remove('navbar-home-scrolled');
      }
    });
  }
}
export { initUpdateNavbarOnScroll };
