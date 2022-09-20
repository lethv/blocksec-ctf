##### ES
¡Bienvenido a este CTF de contratos inteligentes! Este proyecto es el resultado de la realización del TFM: Desarollo de un CTF de Smart Contracts en Solidity.  
En los siguientes desafíos vas a descubrir y explotar algunas de las vulnerabilidades y fallos más habituales en smart contracts implementados en Solidity.  
¡Pásalo bien!

##### EN
Welcome to this smart contract CTF! This project is the result of the execution of the master's thesis: Development of a CTF on Smarts Contracts in Solidity.  
On the following challenges you're going to explore and exploit some of the most common vulnerabilities and flaws in Solidity smart contracts!  
Hope you enjoy it!

### 1 - Hello world!
Este contrato solo quiere darte la bienvenida, pero para hacerlo tendrás que presentarte correctamente. Introduce la respuesta correcta y habrás superado el desafío.

### 2 - Subscription
Este contrato permite realizar depósitos, pagar y consultar el saldo al usuario propietario. Permite también consultar el propietario del contrato de forma pública. La idea es sencilla, cuando toque hacer un pago, el propietario puede realizarlo de forma ágil introduciendo la dirección de destino. Esto se podría automatizar para realizar pagos automáticos de forma periódica.  
El objetivo en este caso consiste en realizar un pago sin ser el propietario, aprovechándose para retirar los fondos del contrato.

### 3- Roulette
Este contrato actúa como el juego de azar de la ruleta. El usuario puede realizar una apuesta a uno de los dos colores disponibles y el contrato determinará si ha acertado o no. En caso de acierto, el participante doblará la cantidad de divisa aportada. En caso de que no haya acertado, el contrato se quedará con la divisa apostada.  
El objetivo es conseguir predecir el color que saldrá en la ruta, a priori aleatorio.

### 4 - Exchange
En este caso, la solución implementada con este contrato actúa como un exchange de divisas. En este los usuarios pueden comprar EUR y USD mediante ethers. También tienen la posibilidad de intercambiar EUR y USD entre si. Y, en última instancia, pueden vender sus EUR y USD por ethers, al mismo precio que los han adquirido.  
El objetivo es conseguir comprar divisa a un precio inferior del estipulado.

### 5 - Auction
Esta solución pretende actuar como lo haría una subasta real. Ofreciendo la posibilidad de pujar, otorgando la subasta a la puja más alta. Es el propietario del contrato, el organizador y quién decide cuando finaliza la subasta y por ende, cuando la puja más alta resulta ganadora. Esta solución es una simplificación, para no vincular el desafío a un espacio temporal. Una vez finalizada la subasta, las pujas que no hayan ganado pueden ser retiradas. También el organizador podrá retirar la puja más alta y ganadora.  
El objetivo en este caso es alterar el funcionamiento correcto de la subasta para conseguir ganarla de forma arbitraria.

### 6 - TokenSale
En este caso se trata de un contrato que funciona ofreciendo un servicio de compra y venta de tokens. En el flujo normal de funcionamiento, el precio de compra y venta de tokens es exactamente el mismo.  
El objetivo es conseguir un beneficio con la compra y venta de tokens. 

### 7 - Raffle
Este desafío está formado por un contrato que permite comprar boletos de una rifa. Una vez vendidos los boletos, el propietario puede acabar el sorteo para determinar el boleto ganador. También en este caso, se adopta esta última restricción para no tener una dependencia temporal, en un entorno real el sorteo finalizaría automáticamente.  
El objetivo es conseguir ganar la lotería más de una vez, teniendo en cuenta que solo se puede jugar una vez por contrato.

### 8 - Splitcount
Este desafío se basa en un contrato que ofrece el servicio de dividir la cuenta en, por ejemplo, un restaurante. El contrato se crea por el negocio indicando la cantidad a pagar y el número de comensales. Una vez desplegado, los clientes deben indicar como quieren dividir la cuenta, si en modo libre (cualquiera puede aportar lo que quiera) o dividirla entre todos. En esta segunda modalidad, cada persona debe pagar, como mínimo, la parte equivalente a repartir la cuenta a partes iguales entre todos los comensales. 
Una vez se ha pagado el importe correcto, el contrato marcará la cuenta como pagada.

El objetivo es conseguir un descuento, pagando la cuenta a un precio inferior al estipulado.
