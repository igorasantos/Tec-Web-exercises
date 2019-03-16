function imprimeLista(){
    document.write("<ul>");
    for(var count = 1; count <= 10; count++){
        document.write( "<li>" + count + "</li>");
    }
    document.write("</ul>");
}