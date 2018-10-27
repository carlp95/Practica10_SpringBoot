var formData = new FormData();
var fileField = document.getElementById("upload-photo");

formData.append('profile', fileField.files[0]);

fetch('/images/profile/', {
    method: 'PUT',
    body: formData
})
    .then(response => response.json())
.catch(error => console.error('Error:', error))
.then(response => console.log('Success:', JSON.stringify(response)));