// Variables
$(document).ready(function(){


	
document.getElementById('submit').onclick=function(){
	 initial = parseInt(document.getElementById('initial_price').value)
	 final = parseInt(document.getElementById('final_price').value)
	 shares = parseInt(document.getElementById('shares').value)
	 buy = parseInt(document.getElementById('buy_commission').value)
	 sell = parseInt(document.getElementById('sell_commission').value)
	 roi = final / initial * 100 - 100
	 gross = (final - initial) * shares
	 net_p = gross - (buy + sell)
	 document.getElementById("net_profit").innerText = net_p;
	 document.getElementById("return_percent").innerText = roi.toFixed(2);
	};
})