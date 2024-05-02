let clicked = false;

let btn = document.getElementById('show-hash')
let element = document.getElementsByClassName('invisible')[0];


btn.addEventListener('click', ()=>{
    if(!clicked){
        btn.innerHTML = "Hide hash";
        element.classList.remove("invisible");
    }
    else{
        btn.innerHTML = "Show hash";
        element.classList.add("invisible");
    }
    clicked = !clicked;
})