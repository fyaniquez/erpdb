precio.oninput = calcular;
cantidad.oninput = calcular;
producto_id.onchange = actualizar;
function calcular() {
    let prc = +precio.value;
    if (!prc) {
        total.value = 0;
        return;
    }
    let ctd = +cantidad.value;
    if (!ctd) {
        total.value = 0;
        return;
    }
    let tot = prc * ctd;
    total.value = tot;
}
function actualizar() {
    let prd = event.target;
    let prc = +prd.options[prd.selectedIndex].getAttribute("precio");        
    precio.value = prc;
    cantidad.value = 1;
    total.value = prc;
    cantidad.select();
    cantidad.focus();
}
