window.onload = function(){   
  ShowAll();
}

function ShowAll()
{
  for(var i = 1; i <= 8; i++ )
  {
    var target = document.getElementById('area' + i);
    if(i % 2 == 1)
      target.setAttribute('style', 'float:left;');

    else
      target.removeAttribute('style' );
  }

  area1.innerHTML = loadHumanhorizontal();  
  area2.innerHTML = loadCarhorizontal();
  area3.innerHTML = loadFacehorizontal();
  area4.innerHTML = loadParkinghorizontal();
  area5.innerHTML = loadCountinghorizontal();
  area6.innerHTML = loadLPRhorizontal();
  area7.innerHTML = loadLoiteringhorizontal();
  area8.innerHTML = loadInvasionhorizontal();
}

function ShowTwo()
{
  for(var i = 1; i <= 8; i++ )
  {
    var target = document.getElementById('area' + i);
    if(i % 2 == 1)
      target.setAttribute('style', 'float:left;');

    else
      target.removeAttribute('style' );
  }

  area1.innerHTML = loadHumanVertical();
  area2.innerHTML = loadCarVertical();
  area3.innerHTML = "";
  area4.innerHTML = "";
  area5.innerHTML = "";
  area6.innerHTML = "";
  area7.innerHTML = "";
  area8.innerHTML = "";
}

function ShowFour()
{
  for(var i = 1; i <= 8; i++ )
  {
    var target = document.getElementById('area' + i);
    if(i % 2 == 1)
      target.setAttribute('style', 'float:left;');

    else
      target.removeAttribute('style' );
  }

  area1.innerHTML = loadHumanVertical();
  area2.innerHTML = loadCarVertical();
  area3.innerHTML = loadFaceVertical();
  area4.innerHTML = loadParkingVertical();
  area5.innerHTML = "";
  area6.innerHTML = "";
  area7.innerHTML = "";
  area8.innerHTML = "";
}

function ShowSix()
{
  area1.innerHTML = loadHumanVertical();

  var target = document.getElementById('area2');
  target.setAttribute('style', 'float:left;');
  area2.innerHTML = loadCarVertical();

  var target = document.getElementById('area3');
  target.removeAttribute('style');

  area3.innerHTML = loadFaceVertical();

  var target = document.getElementById('area4');
  target.setAttribute('style', 'float:left;');

  area4.innerHTML = loadParkingVertical();
  area5.innerHTML = loadLPRVertical();
  area6.innerHTML = loadCountingVertical();
  area7.innerHTML = "";
  area8.innerHTML = "";
}

function loadHumanhorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#F79F81'>사람 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadCarhorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#A9F5F2'>차량 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadFacehorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#D7DF01'>얼굴 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadCountinghorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#FF8000'>카운팅 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadLoiteringhorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#E2A9F3'>배회 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadParkinghorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#A9F5BC'>불법 주 / 정차 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadLPRhorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#D7DF01'>차량번호 인식 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadInvasionhorizontal()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#ffeecc'>침입 <br>7,688<br>전일대비 -313</td>"
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"

  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadHumanVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#F79F81'>사람 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadCarVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#A9F5F2'>차량 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadFaceVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#D7DF01'>얼굴 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadParkingVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#A9F5BC'>불법 주 / 정차 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadCountingVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#FF8000'>카운팅 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadLPRVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#D7DF01'>차량번호 인식 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadLoiteringVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#E2A9F3'>배회 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}

function loadInvasionVertical()
{
  var tag = "<table border='1' cellspacing='0' cellpadding='5'>";

  tag += "<tr>";
  tag += "<td style='text-align:left' bgcolor='#ffeecc'>침입 <br>7,688<br>전일대비 -313</td>"
  tag == "</tr>";

  tag += "<tr>";
	tag += "<td style='text-align:left'>1층 서관 CT실 주 출입구 1,080<br>1층 서관 CT실 앞 남자화장실편 입구 822<br>1층 서관 CT실 앞 로비 320<br>2층 동관 산모휴게실 286<br>1층 서관 임상실험실 280</td>"
  tag += "</tr>";

  tag += "</table>";

  return tag;
}