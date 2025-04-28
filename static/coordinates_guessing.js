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

const observer = new MutationObserver(() => {
    let guess_location_go_to_menu_button = document.getElementById("guess_coordinates_go_to_menu");
    if (guess_location_go_to_menu_button) {
        guess_location_go_to_menu_button.addEventListener("click", (event) => {
            event.preventDefault();
            post('/coordinatesdefine');
        });
        observer.disconnect();
    }
    });
    
observer.observe(document.body, { childList: true, subtree: true });