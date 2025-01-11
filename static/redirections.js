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

if (document.getElementById("register_button")) {
    document.getElementById("register_button").addEventListener("click", (event) => {
      event.preventDefault();
      post('/register');
    });
  }
  
  if (document.getElementById("login_button")) {
    document.getElementById("login_button").addEventListener("click", (event) => {
      event.preventDefault();
      post('/login');
    });
  }
  