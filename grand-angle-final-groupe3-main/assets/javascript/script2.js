
  let cardWidth = document.querySelector('.card').offsetWidth + 10;
  let scrollContainer = document.querySelector(".carousel");
  let backBtn = document.getElementById("left");
  let nextBtn = document.getElementById("right");
  scrollContainer.addEventListener("wheel", (evt)=>{
    evt.preventDefault();
    scrollContainer.scrollLeft += evt.deltaY;
    scrollContainer.style.scrollBehviour = "auto";
    });
    nextBtn.addEventListener("click", ()=>{
        scrollContainer.style.scrollBehviour = "smooth";
        scrollContainer.scrollLeft += 250;
       // scrollContainer.scrollLeft -= cardWidth;
    });
    backBtn.addEventListener("click", ()=>{
        scrollContainer.style.scrollBehviour = "smooth";
        scrollContainer.scrollLeft -= 250;
       // scrollContainer.scrollLeft += cardWidth;
    });
