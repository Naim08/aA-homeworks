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
  // save places on local storage

  const savePlaces = (e) => {
    const ul = document.getElementById("sf-places");
    localStorage.setItem("sf-places", ul.innerHTML);
  };
  // adding SF places as list items

  const addPlace = (e) => {
    e.preventDefault();
    const input = document.querySelector(".favorite-input");
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = input.value;
    ul.appendChild(li);
    input.value = "";
    savePlaces();
  };

  // append places from local storage into sf-places
  const uli = document.getElementById("sf-places");
  uli.innerHTML = localStorage.getItem("sf-places");
  const submit = document.querySelector(".favorite-submit");
  submit.addEventListener("click", addPlace);

  // Your code here

  // adding new photos

  const toggleForm = (e) => {
    const form = document.querySelector(".photo-form-container");
    if (form.className === "photo-form-container") {
      form.className = "photo-form-container hidden";
    } else {
      form.className = "photo-form-container";
    }
  };
  const savePhoto = (e) => {
    const ul = document.querySelector(".dog-photos");
    localStorage.setItem("dog-photos", ul.innerHTML);
  };
  const showForm = document.querySelector(".photo-show-button");
  showForm.addEventListener("click", toggleForm);

  const addPhoto = (e) => {
    e.preventDefault();
    const input = document.querySelector(".photo-url-input");
    const ul = document.querySelector(".dog-photos");
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = input.value;
    li.appendChild(img);
    ul.appendChild(li);
    input.value = "";
    toggleForm();
    savePhoto();
  };

  // add photos from local storage
  const ul = document.querySelector(".dog-photos");
  ul.innerHTML = localStorage.getItem("dog-photos");

  const submitPhoto = document.querySelector(".photo-url-submit");
  submitPhoto.addEventListener("click", addPhoto);

  // save photo on local storage
});
