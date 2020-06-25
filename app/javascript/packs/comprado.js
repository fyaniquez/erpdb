let form = document.forms[0];
[precio, cantidad, total, producto_id] = 
  (function() {return [
    form.comprado_precio, form.comprado_cantidad, 
    form.comprado_total, form.comprado_produco_id]})();
