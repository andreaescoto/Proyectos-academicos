async function convertirDivisa(monto, de, a) {
    const url = `https://api.exchangerate-api.com/v4/latest/${de}`;
    try {
        var respuesta = await fetch(url);
        var datos = await respuesta.json();
        if (datos.rates[a]) {
            var resultado = monto * datos.rates[a];
            console.log(`${monto} ${de} equivale a ${resultado.toFixed(2)} ${a}`);
        } else {
            console.log("Divisa no encontrada.");
        }
    } catch (error) {
        console.log("Error al obtener la tasa de cambio.");
    }
}


convertirDivisa(100, "USD", "EUR");