// JavaScript Document
/*处理获取房屋信息数据*/
function manageHouseInfoData(){
	var tableElm = $("#houseInformationTalbe")[0];
	var tableHeaders = tableElm.getElementsByTagName("thead")[0].getElementsByTagName("th");
	var tableBody = tableElm.getElementsByTagName("tbody")[0];
	
	for(var index = 0; index < infoData.length; index++){
		var tempTr = document.createElement("tr");
		var dataJson = infoData[index].fields;
		tempTr.setAttribute('data', JSON.stringify(dataJson));
		for(var thIndex = 0; thIndex < tableHeaders.length; thIndex++){
			var currentTH = tableHeaders[thIndex];
			var tempTd = document.createElement("td");
			
			var thData = currentTH.getAttribute("data");
			if(dataJson.hasOwnProperty(thData)){
				var dicType = currentTH.getAttribute('dictType');
				if(dicType && dicType != ''){
					for(var dicIndex = 0; dicIndex < dics[dicType].length; dicIndex++){
						var currentdic = dics[dicType][dicIndex];
						if(dataJson[thData] == currentdic.id){
							tempTd.innerHTML = currentdic.label;
							break;
						}
					}
				}else{
					tempTd.innerHTML = dataJson[thData];
				}
			}
			tempTr.appendChild(tempTd);
		}
		tempTr.addEventListener("click", infoTableTrClick);
		
		tableBody.appendChild(tempTr);
		
		tempTr.setAttribute("defaultColor", tempTr.style.backgroundColor);
	}
}


/*处理用户管理列表*/
function manageUserInfoData(){
	var tableElm = $("#userInformationTalbe")[0];
	var tableHeaders = tableElm.getElementsByTagName("thead")[0].getElementsByTagName("th");
	var tableBody = tableElm.getElementsByTagName("tbody")[0];

	for(var index = 0; index < infoData.length; index++){
		var tempTr = document.createElement("tr");
		var dataJson = infoData[index].fields;
		tempTr.setAttribute('data', JSON.stringify(dataJson));
		for(var thIndex = 0; thIndex < tableHeaders.length; thIndex++){
			var currentTH = tableHeaders[thIndex];
			var tempTd = document.createElement("td");

			var thData = currentTH.getAttribute("data");
			if(dataJson.hasOwnProperty(thData)){
				var dicType = currentTH.getAttribute('dictType');
				if(dicType && dicType !== ''){
					let dicArr = dataJson[thData].split(',');
					if(dicArr.length <= 1){
						tempTd.innerHTML = dicArr[0];
					}else{
						let returnStr = '';
						for(let dicIndex = 0; dicIndex < dics[dicType].length; dicIndex++){
							let currentdic = dics[dicType][dicIndex];
							for(let arrIndex = 0; arrIndex <= dicArr.length; arrIndex++){
								let currentData = dicArr[arrIndex];
								currentData = parseInt(currentData);
								if(currentData === currentdic.id){
									returnStr += currentdic.label + ',';
								}
							}
						}
						if(returnStr !== ''){
							returnStr = returnStr.slice(0, returnStr.length - 1);
							tempTd.innerHTML = returnStr;
						}
					}
				}else{
					tempTd.innerHTML = dataJson[thData];
				}
			}
			tempTr.appendChild(tempTd);
		}
		tempTr.addEventListener("click", infoTableTrClick);

		tableBody.appendChild(tempTr);

		tempTr.setAttribute("defaultColor", tempTr.style.backgroundColor);
	}
}
/*处理获取房地产经纪数据*/
function manageRealtyInfoData(){
	var tableElm = $("#realtyInformationTalbe")[0];
	var tableHeaders = tableElm.getElementsByTagName("thead")[0].getElementsByTagName("th");
	var tableBody = tableElm.getElementsByTagName("tbody")[0];

	for(var index = 0; index < infoData.length; index++){
		var tempTr = document.createElement("tr");
		var dataJson = infoData[index].fields;
		tempTr.setAttribute('data', JSON.stringify(dataJson));
		for(var thIndex = 0; thIndex < tableHeaders.length; thIndex++){
			var currentTH = tableHeaders[thIndex];
			var tempTd = document.createElement("td");

			var thData = currentTH.getAttribute("data");
			if(dataJson.hasOwnProperty(thData)){
				var dicType = currentTH.getAttribute('dictType');
				if(dicType && dicType != ''){
					for(var dicIndex = 0; dicIndex < dics[dicType].length; dicIndex++){
						var currentdic = dics[dicType][dicIndex];
						if(dataJson[thData] == currentdic.id){
							tempTd.innerHTML = currentdic.label;
							break;
						}
					}
				}else{
					tempTd.innerHTML = dataJson[thData];
				}
			}
			tempTr.appendChild(tempTd);
		}
		tempTr.addEventListener("click", infoTableTrClick);

		tableBody.appendChild(tempTr);

		tempTr.setAttribute("defaultColor", tempTr.style.backgroundColor);
	}
}
/*信息展示表格行点击处理*/
function infoTableTrClick(event){
	var tempTr = event.currentTarget;
	var tableElm = tempTr.parentNode.parentNode;
	var tempTRs = tableElm.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
	var currentData = tempTr.getAttribute('data').replace(/'/g, '\"');

	currentInfo = $.parseJSON(currentData);

	if(currentInfo.hasOwnProperty('houseInfoJson')){
		currentInfo['houseInfoJson'] = JSON.parse(currentInfo['houseInfoJson'])[0]['fields']
	}
	if(tableElm.getAttribute('id') === 'houseInformationTalbe'){
		$('#editHouseBtn').removeAttr('disabled');
		$('#delHouseBtn').removeAttr('disabled');
		$('#viewHouseBtn').removeAttr('disabled');
	}else if(tableElm.getAttribute('id') === 'leaseInformationTalbe'){
		$('#viewLeaseBtn').removeAttr('disabled');
		$('#payBtn').removeAttr('disabled');
		$('#editLeaseBtn').removeAttr('disabled');
		$('#logOutBtn').removeAttr('disabled');
		$('#shenPiBtn').removeAttr('disabled');
		$('#backBtn').removeAttr('disabled');
		$('#dayinBtn').removeAttr('disabled');
		$('#imageBtn').removeAttr('disabled');
	}else if(tableElm.getAttribute('id') === 'realtyInformationTalbe'){
		$('#editRealtyBtn').removeAttr('disabled');
		$('#delRealtyBtn').removeAttr('disabled');
		$('#viewRealtyBtn').removeAttr('disabled');
		$('#printRealtyBtn').removeAttr('disabled');
	}else if(tableElm.getAttribute('id') === 'userInformationTalbe'){
		$('#editUserBtn').removeAttr('disabled');
		$('#delUserBtn').removeAttr('disabled');
		$('#viewUserBtn').removeAttr('disabled');
	}
	for(var index = 0; index < tempTRs.length; index++){
		tempTRs[index].style.backgroundColor = tempTRs[index].getAttribute("defaultColor");
	}
	tempTr.style.backgroundColor = "skyblue";
}
/*处理获取租凭信息数据*/
function manageLeaseInfoData(){
	var tableElm = $("#leaseInformationTalbe")[0];
	var tableHeaders = tableElm.getElementsByTagName("thead")[0].getElementsByTagName("th");
	var tableBody = tableElm.getElementsByTagName("tbody")[0];
	
	for(var index = 0; index < infoData.length; index++){
		var tempTr = document.createElement("tr");
		var dataJson = infoData[index].fields;
		tempTr.setAttribute('data', JSON.stringify(dataJson));
		for(var thIndex = 0; thIndex < tableHeaders.length; thIndex++){
			var currentTH = tableHeaders[thIndex];
			var tempTd = document.createElement("td");
			
			var thData = currentTH.getAttribute("data");
			if(dataJson.hasOwnProperty(thData)){
				var dicType = currentTH.getAttribute('dictType');
				if(dicType && dicType != ''){
					for(var dicIndex = 0; dicIndex < dics[dicType].length; dicIndex++){
						var currentdic = dics[dicType][dicIndex];
						if(dataJson[thData] == currentdic.id){
							tempTd.innerHTML = currentdic.label;
							break;
						}
					}
				}else{
					tempTd.innerHTML = dataJson[thData];
				}
			}
			if(thData.indexOf('_') !== -1){
				var DataArr = thData.split('_');
				var houseInfo = JSON.parse(dataJson[DataArr[0]])[0]['fields'];
				tempTd.innerHTML = houseInfo[DataArr[1]];
			}
			tempTr.appendChild(tempTd);
		}
		tempTr.addEventListener("click", infoTableTrClick);
		
		tableBody.appendChild(tempTr);
		
		tempTr.setAttribute("defaultColor", tempTr.style.backgroundColor);
	}
}