document.addEventListener("DOMContentLoaded", () => {
  // write a ajax request to https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b
  // and console.log the response

  const xhr = new XMLHttpRequest();
  const url =
    "https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b";

  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      console.log(xhr.responseText);
    }
  };

  xhr.open("GET", url);
  xhr.send();

  // write a fetch request to https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b
  // and console.log the response

  fetch(url)
    .then((response) => response.json())
    .then((data) => console.log(data))
    .catch((error) => console.log(error));

  // write a fetch request to https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b
  // and console.log the response using async await

  async function getWeather() {
    const response = await fetch(url);
    const data = await response.json();
    console.log(data);
  }

  getWeather();

  // write a fetch request to https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b
  // and console.log the response using async await and try catch

  async function getWeatherWithError() {
    try {
      const response = await fetch(url);
      const data = await response.json();
      console.log(data);
    } catch (error) {
      console.log(error);
    }
  }

  getWeatherWithError();

  // write a fetch request to https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b
  // and console.log the response using async await and try catch
  // and display the weather in the DOM
  // and display the weather in the DOM using async await and try catch

  async function getWeatherWithDOM() {
    try {
      const response = await fetch(url);
      const data = await response.json();
      console.log(data);
      document.getElementById("weather").innerHTML =
        data.weather[0].description;

      const img = document.createElement("img");
      img.src = `http://openweathermap.org/img/w/${data.weather[0].icon}.png`;
      // add annimationn when adding image to dom
      img.classList.add("animated", "bounceIn");

      document.getElementById("weather").appendChild(img);

      const temp = document.createElement("p");
      temp.innerHTML = "Temperature: ";
      temp.classList.add("temp");
      document.getElementById("weather").appendChild(temp);
      const span = document.createElement("span");
      span.innerHTML = data.main.temp;
      document.querySelector(".temp").appendChild(span);

      const feelsLike = document.createElement("p");
      feelsLike.innerHTML = "Feels like: ";
      feelsLike.classList.add("feels-like");
      document.getElementById("weather").appendChild(feelsLike);
      const span2 = document.createElement("span");
      span2.innerHTML = data.main.feels_like;
      document.querySelector(".feels-like").appendChild(span2);

      const humidity = document.createElement("p");
      humidity.innerHTML = "Humidity: ";
      humidity.classList.add("humidity");
      document.getElementById("weather").appendChild(humidity);
      const span3 = document.createElement("span");
      span3.innerHTML = data.main.humidity;
      document.querySelector(".humidity").appendChild(span3);

      const wind = document.createElement("p");
      wind.innerHTML = "Wind: ";
      wind.classList.add("wind");
      document.getElementById("weather").appendChild(wind);
      const span4 = document.createElement("span");
      span4.innerHTML = data.wind.speed;
      document.querySelector(".wind").appendChild(span4);
    } catch (error) {
      console.log(error);
    }
  }

  getWeatherWithDOM();
});
