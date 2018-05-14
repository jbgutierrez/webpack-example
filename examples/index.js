(function() {
  const title = document.getElementById('title');
  const main = document.getElementById('main');
  const spinner = document.getElementById('spinner');

  function show(el) {
    el.style.display = 'block';
  };

  function hide(el) {
    el.style.display = 'none';
  };

  function navigate(delay) {
    if (document.title) {
      console.warn("---> leaving " + document.title);
    }
    show(spinner);
    const page = location.hash.substring(1) || 'home';
    success = function() {
      hide(spinner);
      hide(main);
      main.innerHTML = "";
      title.innerText = document.title = page;
      console.warn("---> entering " + document.title);
      if (typeof(__contentsHandler) !== 'undefined') {
        __contentsHandler(page);
      }
      show(main);
    };
    setTimeout(success, 500);
  };

  window.onhashchange = navigate;
  navigate();
})();
