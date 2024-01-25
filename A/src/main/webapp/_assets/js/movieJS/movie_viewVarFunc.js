  
  
  var galleryThumbs = new Swiper(".gallery-thumbs .swiper-container", {
    spaceBetween: 10,
    slidesPerView: 6,
    freeMode: true,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
    observer: true,
    observeParents: true,
  });
    
  var galleryTop = new Swiper(".gallery-top", {
    spaceBetween: 0,
    observer: true,
    observeParents: true,
    navigation: {
      nextEl: ".gallery-thumbs .swiper-button-next",
      prevEl: ".gallery-thumbs .swiper-button-prev",
    },
    thumbs: {
      swiper: galleryThumbs
    }
  });
  
  var stillcutSwiper = new Swiper(".stillcut-fixed .swiper-container", {
    navigation: {
      nextEl: ".stillcut-fixed .swiper-button-next",
      prevEl: ".stillcut-fixed .swiper-button-prev",
    },
    pagination: {
      el: ".stillcut-fixed .swiper-pagination",
      type: "fraction",
    },
    observer: true,
    observeParents: true,
  });
  
  if ($(".thums .swiper-slide").length > 3) {
    $(".thums").removeClass("if");
    var previewMovieSwiper = new Swiper(".thums .swiper-container", {
      navigation: {
        nextEl: ".thums .swiper-button-next",
        prevEl: ".thums .swiper-button-prev",
      },
      slidesPerView: "2",
      spaceBetween: 5,
      observer: true,
      observeParents: true,
      breakpoints: {
        1023: {
          slidesPerView: "3",
          spaceBetween: 16,
        }
      }
    });
  }