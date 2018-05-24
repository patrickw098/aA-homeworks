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


const submitButton = document.querySelector(".favorite-submit");
submitButton.addEventListener("click", submitForm)


const submitForm = (event) => {
  event.preventDefault();

  const input = document.querySelector(".favorite-input");
  const inputValue = input.value;
  const li = document.createElement("li");
  li.textContent = inputValue;

  const ul = document.getElementById('sf-places');
  ul.appendChild(li);


}
  // adding SF places as list items

  // --- your code here!

  const showForm = (event) => {
      const photoContainer = document.querySelector(".photo-form-container");
      if (photoContainer.className === "photo-form-container") {
        photoContainer.className = "photo-form-container hidden";
      } else {
        photoContainer.className = "photo-form-container";
      }
    };

    const showPhotoButton = document.querySelector(".photo-show-button");
    photoButton.addEventListener("click", showPhotoForm);


    const submitPhoto = (event) => {
      event.preventDefault();

      const photoUrl = document.querySelector(".photo-url-input");
      const photoUrlValue = photoUrlInput.value;
      photoUrl.value = "";

      const newImg = document.createElement("img");
      newImg.src = photoUrl;

      const newPhotoLi = document.createElement("li");
      newPhotoLi.appendChild(newImg);

      const dogPhotosList = document.querySelector(".dog-photos");
      dogPhotosList.appendChild(newPhotoLi);
    };

    const photoSubmit = document.querySelector(".photo-url-submit");
    photoSubmit.addEventListener("click", submitPhoto);
  });


  // adding new photos

  // --- your code here!



});
