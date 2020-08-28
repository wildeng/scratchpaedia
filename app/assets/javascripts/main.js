document.addEventListener('click', function(event){
  if(event.target.dataset.dismiss == "alert"){
    document.getElementsByClassName("notifications")[0].innerHTML = "";
  }
});
