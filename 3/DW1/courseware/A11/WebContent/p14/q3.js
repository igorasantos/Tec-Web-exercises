var newWin;
var buttonArray = document.getElementsByTagName("button");
Array.prototype.forEach.call(buttonArray, btn => {
  switch (btn.id) {
    case 'buttonOpen':
      btn.addEventListener("click", openNewWindow);
      break;
    default:
      btn.addEventListener("click", move);
      break;
  }
});
function openNewWindow() {
  newWin = window.open('', '', "width=200, height=100");
  newWin.document.write("<p>New win</p>");
}
function move() {
  var movType = readOp();
  var posX = document.getElementById("inputPositionX").value;
  var posY = document.getElementById("inputPositionY").value;
  if (movType === 1) {
    newWin.moveBy(posX, posY);
  } else {
    newWin.moveTo(posX, posY);
  }
  newWin.focus();
}
function readOp() {
  var op;
  if (document.getElementById("radioButton1").checked) {
    op = 1;
  } else {
    op = 2;
  }
  return op;
}