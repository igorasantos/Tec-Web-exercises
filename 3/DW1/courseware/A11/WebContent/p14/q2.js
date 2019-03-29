function openNewWindow() {
  window.open(window.location.href);
}
function closeWindow() {
  // Browser returns the message: "Scripts may close only the windows that were opened by it."
  // And it do works at the opened tab.
  window.close();
}
var buttonArray = document.getElementsByTagName("button");
Array.prototype.forEach.call(buttonArray, btn => {
  switch (btn.id) {
    case 'buttonOpen':
      btn.addEventListener("click", openNewWindow);
      break;
    default:
      btn.addEventListener("click", closeWindow);
      break;
  }
});