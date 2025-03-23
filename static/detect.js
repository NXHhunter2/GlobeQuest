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

let detect_time = parseInt(localStorage.getItem('detect_time')) || 3;

const timeCounter = setInterval(()=>{
  if (detect_time <= 0) {
    clearInterval(timeCounter);
    show(element, 2)
    return;
  }
  detect_time -= 1;
  document.getElementById('detect_timer').innerHTML = "Time left: " + detect_time + "s";
}, 1000)

document.getElementById("detect").addEventListener("click", (event) => {
    event.preventDefault();
    localStorage.setItem("scroll", window.scrollY);
    post('/detect', {type: "Detect"});
});

const observer = new MutationObserver(() => {
  let detect_go_to_menu_button = document.getElementById("detect_go_to_menu");
  if (detect_go_to_menu_button) {
    detect_go_to_menu_button.addEventListener("click", (event) => {
          event.preventDefault();
          post('/detectdefine');
      });
      observer.disconnect();
  }
});

observer.observe(document.body, { childList: true, subtree: true });