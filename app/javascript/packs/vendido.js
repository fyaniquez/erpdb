let form = document.forms[0];
[precio, cantidad, total, producto_id] = 
  (function() {return [
    form.vendido_precio, form.vendido_cantidad, 
    form.vendido_total, form.vendido_producto_id]})();
