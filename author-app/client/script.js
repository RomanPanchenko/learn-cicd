document.addEventListener('DOMContentLoaded', function () {
  document.getElementById('fetchButton').addEventListener('click', function () {
    fetch('http://localhost:3001/author/1')
      .then(response => response.json())
      .then(data => {
        document.getElementById('displayName').innerText = data.name;
      })
      .catch(error => {
        console.error('Query error:', error);
        document.getElementById('displayName').innerText = 'Error data fetching';
      });
  });
});
