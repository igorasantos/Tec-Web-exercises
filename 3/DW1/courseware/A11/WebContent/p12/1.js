// not secure method to get browser data: https://stackoverflow.com/questions/14573881/why-does-javascript-navigator-appname-return-netscape-for-safari-firefox-and-ch
document.write("<p><em>Browser:</em> " + navigator.appName+"</p>"); // returns "Netscape" for Chromium
document.write("<p><em>Versão do Browser:</em> " + navigator.appVersion+"</p>");

document.write("<p><em>Cookies habilitados:</em> " + navigator.cookieEnabled+"</p>");
document.write("<p><em>Plataforma:</em> " + navigator.platform+"</p>");