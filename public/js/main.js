// TARGETS
const target = document.querySelector('.content');
const searchBtn = document.getElementById('searchBtn');

// EVENTS
searchBtn.addEventListener('click', () => {
  getVolumes();
});

// AJAX
async function getVolumes(page = 1) {
  // Get form data
  const form = {
    author: document.forms['search']['author'].value,
    title: document.forms['search']['title'].value,
    year: document.forms['search']['year'].value
  }

  // Send request and put response as content
  const response = await fetch(`http://localhost/LibraryWebApp/public/ajaxSearchVolumes/${page}?author=${form.author}&title=${form.title}&year=${form.year}`);
  const volumes =  await response.text();
  target.innerHTML = volumes;

  // Set pagination buttons behaviors
  const paginationBtns = document.getElementsByName('paginationButton')
  paginationBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      getVolumes(btn.value);
    });
  });
}