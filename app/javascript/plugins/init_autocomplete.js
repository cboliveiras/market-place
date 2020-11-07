import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('place_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };