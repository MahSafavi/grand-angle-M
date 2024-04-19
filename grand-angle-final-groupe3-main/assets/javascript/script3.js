document.addEventListener("DOMContentLoaded", function() {
    const selectFilter = document.getElementById('select-filter');
  
    selectFilter.addEventListener('change', function() {
      const selectedType = this.value;
      const targetElement = document.getElementById(selectedType.toLowerCase().replace(' ', '-'));
      if   (targetElement) {
        targetElement.scrollIntoView({ behavior: 'smooth' });
      }
    });
  });