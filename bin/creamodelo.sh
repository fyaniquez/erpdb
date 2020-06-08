rails g model pais nombre:string{50}:unique:index iso2:string{2}:unique
rails g model persona nombre:string{50}:index:unique
rails g model usuario persona:references identificacion:string:unique password:digest externo:string{255} estado:string{20}
rails g model empresa persona:references pais:references nit:string{20}
rails g model marca nombre:string{30}:unique empresa:references activa:string{2}
rails g model capitulo nombre:string{30}:index:unique
rails g model categoria capitulo:references nombre:string{30}
rails g model producto usuario:references marca:references categoria:references nombre:string{30}:index:unique unidad:string{5}
rails g model almacen nombre:string:unique estado:string{20}
rails g model transaccion type usuario:references almacen:references fecha:datetime objeto:integer glosa:string{255} estado:string{20}
rails g model precio producto:references almacen:references por:string{30} prc:integer cantidad:integer barras:string{20} orden:integer
rails g model detalle type transaccion:references producto:references precio:integer cantidad:integer total:integer
