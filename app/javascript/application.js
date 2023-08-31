// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("turbo:load", function() {
  $('.carousel').slick({
    dots: true,
    autoplay: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      },
    ]
  });
});


document.addEventListener("DOMContentLoaded", function() {
  const cloudName = "v1692949083";
  const folderName = "c525ea02988966fa731ca824b07b6ae3a4";
  const apiKey = "497679343249287";
  const apiSecret = "VHSFYrA3SG65XyZFDtS9xAAE2yU";

  const baseUrl = `https://api.cloudinary.com/v1_1/${cloudName}/resources/image/upload`;

  const images = [];

  $.ajax({
    url: baseUrl,
    type: "GET",
    data: {
      type: "upload",
      prefix: folderName,
      api_key: apiKey,
      timestamp: Math.floor(Date.now() / 1000),
      signature: $.cloudinary.utils.api_sign_request(
        {
          timestamp: Math.floor(Date.now() / 1000),
          folder: folderName,
        },
        apiSecret
      ),
    },
    success: function(data) {
      data.resources.forEach(function(resource) {
        images.push(resource.secure_url);
      });
    },
    complete: function() {
      const carousel = $("#image-carousel");
      const nextButton = $("#next-button");

      nextButton.on("click", function() {
        const randomIndex = Math.floor(Math.random() * images.length);
        const imageUrl = images[randomIndex];
        carousel.html(`<div class="carousel-item"><img src="${imageUrl}" alt="Random Image"></div>`);
      });
    },
  });
});
