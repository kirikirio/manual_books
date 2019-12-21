$(function () {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('data', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('.input-image').change(function () {
    console.log('fire')
    readURL(this);
  });
});