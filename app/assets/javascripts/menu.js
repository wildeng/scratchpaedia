
/* Toggle Mobile menu */
function toggleMenu(menu,toggle) {
  if(menu.classList.contains("active")){
    menu.classList.remove("active");
    menu.style.display = "none";
    changeIcon("<i class='fas fa-bars' data-target-id=\"menu\" data-turbolinks=\"false\"></i>");
  } else {
    menu.classList.add("active");
    menu.style.display = "block";
    changeIcon("<i class='fas fa-times' data-target-id=\"menu\" data-turbolinks=\"false\"></i>");
  }
}

function changeIcon(icon){
  document.getElementsByClassName('toggle')[0].querySelector('a').innerHTML = icon;
}

document.addEventListener('click', function(event) {
  const toggle = document.querySelector(".toggle");
  const menu = document.querySelector(".menu");
  let id = event.target.dataset.targetId;
  if( id != undefined){
    toggleMenu(menu, toggle);
  }
});
