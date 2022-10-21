function validarnombre(val){
    var regex = /[a-zA-Z ]/;
    if (val == null){
        return 1;
    }else if (val.length < 3 ){
        return 2;
    }else if(!(regex.test(val))){
        return 3;
    }else{
        return 4;
    }
}

function SoloLetras(e)
{
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toString();
    letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnopqrstuvwxyzáéíóú";

    especiales = [8,13];
    tecla_especial = false
    for(var i in especiales) {
        if(key == especiales[i]){
            tecla_especial = true;
            break;
        }
    }
}