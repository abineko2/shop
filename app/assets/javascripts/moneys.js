/*会計処理*/
function clearMoney() {
  
  var inputMoney = document.getElementById('input-money');
  var money = Number(inputMoney.value);
  var tsuri = money - price;
  if(tsuri >= 0){
     $.ajax({
       /*url: "http://localhost:3000/getMoney/"+money,*/
       url: "https://young-castle-65049.herokuapp.com/getMoney/"+money,
       type:"POST",
       data: {obj: array},
       dataType:"json",
       
     }).done(function(){
        
     });
    alert("ありがとございます。お釣りは"+String(tsuri)+"です。");
    $('#calc-modal').modal('hide');
    price = 0;
    number.value = "";
    priceLabel.textContent = price+"円"; /*会計ラベル初期化*/
    count = 0;            /*テーブルの初期化*/
    table.style.display = "none";



  }
  else alert("お金が足りません。");
  
}