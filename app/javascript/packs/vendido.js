let form = document.forms[0];
form.vendido_precio.oninput = calcular;
form.vendido_cantidad.oninput = calcular;
form.vendido_producto_id.onchange = actualizar;
function calcular() {
    let prc = +form.vendido_precio.value;
    if (!prc) {
        form.vendido_total.value = 0;
        return;
    }
    let ctd = +form.vendido_cantidad.value;
    if (!ctd) {
        form.vendido_total.value = 0;
        return;
    }
    let total = prc * ctd;
    form.vendido_total.value = total;
}
function actualizar() {
    let prd = event.target;
    let prc = +prd.options[prd.selectedIndex].getAttribute("prc");        
    form.vendido_precio.value = prc;
    form.vendido_cantidad.value = 1;
    form.vendido_total.value = prc;
    form.vendido_cantidad.select();
    form.vendido_cantidad.focus();
}