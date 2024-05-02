function post(path, params, method='post') {
    const form = document.createElement('form');
    form.method = method;
    form.action = path;

    for (const key in params) {
      if (params.hasOwnProperty(key)) {
        const hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = key;
        hiddenField.value = params[key];
    
        form.appendChild(hiddenField);
      }
    }

    document.body.appendChild(form);
    form.submit();
}
function checkLocal(){
  switch(document.getElementById("time-range").value){
    case "0": 
        document.getElementsByClassName("time-output")[0].innerHTML = "10s";
        localStorage.setItem('time', 10);
        break;
    case "1": 
        document.getElementsByClassName("time-output")[0].innerHTML = "15s";
        localStorage.setItem('time', 15);
        break;
    case "2": 
        document.getElementsByClassName("time-output")[0].innerHTML = "30s";
        localStorage.setItem('time', 30);
        break;
    default:
        document.getElementsByClassName("time-output")[0].innerHTML = "30s";
        localStorage.setItem('time', 30);
        break;

}
}


if(document.getElementById("europe")){
  document.getElementById("europe").addEventListener("click", (event) => {
    event.preventDefault();
    checkLocal();
    post('/draw', {region: "Europe"});
  });
}

if(document.getElementById("world")){
document.getElementById("world").addEventListener("click", (event) => {
    event.preventDefault();
    checkLocal();
    post('/draw', {region: "World"});
});
}


if(document.getElementById("detect")){
document.getElementById("detect").addEventListener("click", (event) => {
  event.preventDefault();
  post('/detect', {type: "Detect"});
});
}

if(document.getElementById("drawdefine")){
  document.getElementById("drawdefine").addEventListener("click", (event) => {
    event.preventDefault();
    post('/drawdefine', {type: "Drawdefine"});
  });
}
