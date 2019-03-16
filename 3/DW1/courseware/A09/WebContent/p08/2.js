function imprimeLista(quantidade){
    document.write("<ul>");
    for(var count=1; count <= quantidade; count++){
        document.write( "<li>" + count + "</li>");
    }
    document.write("</ul>");
}