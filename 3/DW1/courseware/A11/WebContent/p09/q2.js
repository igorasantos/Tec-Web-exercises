function printChar(txt, i) {
  var cachedLetter = txt.charAt(i);
  document.getElementById('divResult').classList.remove('d-none');
  document.getElementById('divResult').classList.add('d-block');
  document.getElementById('divResult').innerText = cachedLetter;
}
function validateInput2() {
  var sizeInput1 = document.getElementById('formInput1').value.length;
  var input2 = document.getElementById('formInput2');
  if (sizeInput1 > input2.value) {
    input2.setCustomValidity("");
  } else {
    input2.setCustomValidity("Campo invalido");
  }
}
// adapted from: https://getbootstrap.com/docs/4.3/components/forms/#custom-styles
(function () {
  'use strict';
  window.addEventListener('load', function () {
    var forms = document.getElementsByClassName('needs-validation');
    // it's just running one time - needs to be improved
    var validation = Array.prototype.filter.call(forms, function (form) {
      // pt: form é o formulário em questão, na lista de formulários existentes na página
      form.addEventListener('submit', function (event) {
        //adaptation starts here
        validateInput2();
        if (form['formInput2'].checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
          // kludge - start
          document.getElementById('invalidMsg').style.display = 'block';
          // kludge - end
        } else if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        } /* just to see when the validation is true - start */ else {
          event.preventDefault();
          event.stopPropagation();
          // just to see when the validation is true - end
          printChar(form['formInput1'].value, form['formInput2'].value);
        }
        //adaptation ends here
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();