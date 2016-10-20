document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  // const addPlaceLi =
  const placeFormSubmit = document.querySelector('.favorite-submit')

  placeFormSubmit.addEventListener('click', (e) => {
    e.preventDefault();

    const li = document.createElement('li');

    const placeInput = document.querySelector('.favorite-input');
    const placeName = placeInput.value;

    placeInput.value = '';

    li.textContent = placeName;

    const ul = document.getElementById('sf-places');

    ul.appendChild(li);
  })


  // adding new photos

  // --- your code here!

  // Create and show form

  const photoFormButton = document.querySelector('.photo-show-button');

  photoFormButton.addEventListener('click', e => {
    const photoForm = document.querySelector('.photo-form-container');
    if(photoForm.className === 'photo-form-container hidden') {
      photoForm.className = 'photo-form-container';
    } else {
      photoForm.className = 'photo-form-container hidden';
    }
  })

  const photoSubmitButton = document.querySelector('.photo-url-submit');

  photoSubmitButton.addEventListener('click', e => {
    e.preventDefault();

    const photoForm = document.querySelector('.photo-form-container');
    const photoInput = document.querySelector('.photo-url-input');
    const photoUrl = photoInput.value;

    photoInput.value = "";

    const ul = document.querySelector('.dog-photos');

    const li = document.createElement('li');
    const img = document.createElement('img');

    img.src = photoUrl;

    li.appendChild(img);
    ul.appendChild(li);
  })

});
