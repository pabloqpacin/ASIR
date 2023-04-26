/* [1] Botones & Alertas */
function pulsarBoton_a(){
    alert('hola mundo');
}

function pulsarBoton_b(input){
    alert(input);
}

/* [2] Mostrar VS Ocultar Contenido*/
function deshabilitarSeleccion(){
    const estadoCheckbox = document.getElementById("thaCheckbox").checked;
    console.log(estadoCheckbox);
    if (estadoCheckbox == false) {
        // if (!estadoCheckbox) {
        document.getElementById("seleccion_hollow").disabled = true;
        document.getElementById("boton_enviar").disabled = true;
    } else if (estadoCheckbox == true) {
        document.getElementById("boton_enviar").disabled = false;
        document.getElementById("seleccion_hollow").disabled = false;
    }
}

function cambiarSeleccion(){
    const paragraph_hollow = document.getElementById("seleccion_hollow").selectedIndex;
    console.log(paragraph_hollow);
    if (paragraph_hollow == 1) {
        document.getElementById("hollow_0").hidden = false;
        document.getElementById("hollow_1").hidden = true;
    } else if (paragraph_hollow == 2) {
        document.getElementById("hollow_0").hidden = true;
        document.getElementById("hollow_1").hidden = false;
    } else {
        document.getElementById("hollow_0").hidden = true;
        document.getElementById("hollow_1").hidden = true;
    }
}

/* [3] Autocompletar Campos */
function seleccionarColor(){
    const color = document.getElementById("seleccion_color");
    console.log(color.selectedIndex);
    console.log(color.options[color.selectedIndex].text);
    console.log(color.options[color.selectedIndex].value);
    document.getElementById("campo_0").value = color.selectedIndex;
    document.getElementById("campo_1").value = color.options[color.selectedIndex].text;
    document.getElementById("campo_2").value = color.options[color.selectedIndex].value;
}
