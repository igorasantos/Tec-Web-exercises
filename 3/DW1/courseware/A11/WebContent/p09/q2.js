function printChar(txt, i) {
  let cachedLetter = txt.charAt(i);
  let areaAlerta = document.getElementById('divResult');
  areaAlerta.classList.remove('d-none');
  areaAlerta.classList.add('d-block');
  areaAlerta.innerText = cachedLetter;
};

function apagaAlert() {
  let areaAlerta = document.getElementById('divResult');
  if (!areaAlerta.classList.contains('d-none')) {
    areaAlerta.innerText = '';
    areaAlerta.classList.remove('d-block');
    areaAlerta.classList.add('d-none');
  }
};

function validateInputNumerico(inputTxt, inputNum) {
  let sizeInputTxt = inputTxt.value.length;
  let valorInputNum = inputNum.value;
  if (sizeInputTxt > valorInputNum) {
    inputNum.setCustomValidity('');
  } else {
    inputNum.setCustomValidity('Campo invalido');
  }
};

function adicionaEstadoFormValidado(form) {
  if (!form.classList.contains('was-validated')) {
    form.classList.add('was-validated');
  }
}

function removeEstadoFormValidado(form) {
  if (form.classList.contains('was-validated')) {
    form.classList.remove('was-validated');
  }
};

(function () {
  window.addEventListener(
    'load',
    function () {
      let forms = document.getElementsByClassName('needs-validation');
      Array.prototype.filter.call(forms, function (form) {
        form.addEventListener(
          'submit',
          function (event) {
            validateInputNumerico(form['formInput1'], form['formInput2']);
            if (!form['formInput2'].checkValidity() || !form.checkValidity()) { // se o teste ou algum outro input no form tiver inválido
              apagaAlert();
              event.preventDefault();
              event.stopPropagation();
              adicionaEstadoFormValidado(form);
            } else { // se tiver ok
              event.preventDefault();
              event.stopPropagation();
              printChar(form['formInput1'].value, form['formInput2'].value); // comportamento adicional
              adicionaEstadoFormValidado(form);
            }
          },
          false
        );
      });
    },
    false
  );
})();


(function () {
  window.addEventListener(
    'load',
    function () {
      let forms = document.getElementsByClassName('needs-validation');
      Array.prototype.filter.call(forms, function (form) {
        form.addEventListener(
          'reset',
          function () {
            removeEstadoFormValidado(form);
            apagaAlert();
          },
          false
        );
      });
    },
    false
  );
})();
