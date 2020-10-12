/*create by haoran on 2020.09.04*/
/*添加租凭信息时选择的房屋信息*/
var leaseHouseInfo;
/*触发页签交换*/
function onClickTabBar(obj){
	if(obj.getAttribute("status") != "select"){
		var currentUl = obj.parentElement;
		var currentDivs = currentUl.getElementsByTagName("div");
		for(var index = 0; index < currentDivs.length; index++){
			currentDivs[index].setAttribute("status", "");
		}
		obj.setAttribute("status", "select");
		
		var tempValue = obj.getAttribute("value");
		var houseinfoDiv = $("#houseTableDiv")[0];
		var leaseinfoDiv = $("#leaseTableDiv")[0];
		if(tempValue == "realtyInfo"){
			houseinfoDiv.style.display = "block";
			leaseinfoDiv.style.display = "none";
		}else if(tempValue == "lease"){
			houseinfoDiv.style.display = "none";
			leaseinfoDiv.style.display = "block";
		}
	}
}

/*打开房屋信息添加窗口*/
function openHousePopup(currentObj){
	cleanHouseAddPopup();
	if(currentObj.id == 'addHouseBtn'){
		$('#houseForm').attr('method', 'post');
		$('#houseForm').attr('action', 'newHouse');
	}else if(currentObj.id == 'editHouseBtn'){
		$('#houseForm').attr('method', 'post');
		$('#houseForm').attr('action', "editHouse/" + currentInfo.id + "/");
		manageHousePopupInfo();
	}
	$('#popupMake').show();
	$('#houseAddDiv').show();
//	var houseAddDiv = document.getElementById("houseAddDiv");
//	houseAddDiv.style.display = "block";
}
/*删除房屋数据*/
function deleteHouseInfo(){
	r = confirm('确定删除<产籍号>为<' + currentInfo.houseID + '>的房产数据吗？');
	if(r == true){
		window.location.href="deleteHouse/" + currentInfo.id + "/";
	}else{

	}
}
/*关闭房屋信息添加窗口*/
function closeHousePopup(){
	cleanHouseAddPopup();
	$('#popupMake').hide();
	$('#houseAddDiv').hide()
//	var houseAddDiv = document.getElementById("houseAddDiv");
//	houseAddDiv.style.display = "none";
}
/*处理房屋信息致弹窗数据*/
function manageHousePopupInfo(){
	for(var item in currentInfo){
		manageInputElementValue(item, currentInfo[item]);
	}
}
redioArr = ['quanZheng', 'chanQuanXianDing', 'zhengJianQiQuan', 'yiLiuWenTi', 'chanQuanJiuFen', 'gaiBianXingZhi', 'chengDanChengDan', 'qiYueGuiDing', 'shenHeWenTi']
/*处理input组件赋值*/
function manageInputElementValue(id, value){
	var idStr = '#' + id;
	if(redioArr.indexOf(id) !== -1){
		let currentEle = $('[name=' + id + ']');
		for(index = 0; index < currentEle.length; index++){
			if(value.toString() === currentEle[index].value){
				currentEle[index].checked=true;
				break;
			}
		}
	}else{
		$(idStr).attr('value', value);
	}
}
/*清理房屋信息添加窗口*/
function cleanHouseAddPopup(){
	$("#houseID").attr("value", "");
	$("#propertyID").attr("value", "");
	$("#houseAdd").attr("value", "");
	$("#houseUse").attr("value", -1);
	$("#houseStructure").attr("value", -1);
	$("#houseArea").attr("value", "");
	$("#landArea").attr("value", "");
	$("#houseOwner").attr("value", "");
	$("#ownerPhone").attr("value", "");
	$("#IDType").attr("value", -1);
	$("#propertyType").attr("value", -1);
	$("#IDNum").attr("value", "");
}

/*打开租凭信息添加窗口*/
function openLeasePopup(currentObj){
	cleanLeaseAddPopup();
	$('#popupMake').show();
	// $('#leaseForm').scrollTop = 0;
	$('#shenPiBtnDiv').hide();
	$('#formBtnDiv').hide();
	$('#tuiHuiBtnDiv').hide();
	let leaseFormEle = $('#leaseForm');
	if(currentObj.id === 'addLeaseBtn'){
		leaseFormEle.attr('method', 'post');
		leaseFormEle.attr('action', 'newLease');
		leaseFormEle.find('input, select, textarea').not('.disabled').removeAttr('disabled');
		$('#formBtnDiv').show();
	}else if(currentObj.id === 'editLeaseBtn'){
		leaseFormEle.attr('method', 'post');
		leaseFormEle.attr('action', "editLease/" + currentInfo.id + "/");
		leaseFormEle.find('input, select, textarea').not('.disabled').removeAttr('disabled');
		$('#formBtnDiv').show();
		manageLeasePopupInfo();
	}else if(currentObj.id === 'viewLeaseBtn'){
		leaseFormEle.attr('action', "");
		leaseFormEle.find('input, select, textarea').not('.disabled').attr('disabled', 'disabled');
		manageLeasePopupInfo();
	}else if(currentObj.id === 'shenPiBtn'){
		leaseFormEle.attr('action', "");
		leaseFormEle.find('input, select, textarea').not('.disabled').attr('disabled', 'disabled');
		$('#shenPiBtnDiv').show();
		manageLeasePopupInfo();
	}else if(currentObj.id === 'backBtn'){
		leaseFormEle.attr('action', "");
		leaseFormEle.find('input, select, textarea').not('.disabled').attr('disabled', 'disabled');
		$('#tuiHuiBtnDiv').show();
		manageLeasePopupInfo();
	}
	$('#leaseAddDiv').show();
}


/*标签显隐*/
/*function setElementShowHide(activate){
	$('#houseForm')
}*/
/*关闭房屋信息添加窗口*/
function closeLeaseAddPopup(currentObj){
	cleanLeaseAddPopup();
	var addDiv;
	if(currentObj){
		addDiv = currentObj.parentNode.parentNode;
		while(true){
			if(addDiv.getAttribute('class') == 'addEditPopupDiv'){
				break;
			}else{
				addDiv = addDiv.parentNode;
			}
		}
	}else{
		addDiv = document.getElementById("leaseAddDiv");
	}
	// var leaseAddDiv = document.getElementById("leaseAddDiv");
	addDiv.style.display = "none";
	$('#popupMake').hide();
}

/*处理租凭信息致弹窗数据*/
function manageLeasePopupInfo(){
	getHouseInfoByKey('id', currentInfo['house'])
	for(var item in currentInfo){
		manageInputElementValue(item, currentInfo[item]);
	}
}

/*删除租凭数据*/
function deleteLeaseInfo(){
	var r = confirm('确定删除<产籍号>为<' + currentInfo.houseInfoJson.houseID + '>的房产数据吗？');
	if(r == true){
		window.location.href="deleteLease/" + currentInfo.id + "/";
	}else{
		
	}
}
/*清理房屋信息添加窗口*/
function cleanLeaseAddPopup(){
	$("#leaseHouseID").attr("value", "");
	$("#acceptID").attr("value", "");
	$("#leaseHouseOwner").attr("value", "");
	$("#ownerIDType").attr("value", "");
	$("#ownerID").attr("value", "");
	$("#ownerPhone").attr("value", "");
	$("#leaseHouseArea").attr("value", "");
	$("#leaseArea").attr("value", "");
	$("#leaseHolder").attr("value", "");
	$("#holderPhone").attr("value", "");
	$("#holderIDType").attr("selected", -1);
	$("#holderID").attr("value", "");
	$("#leaseMoney").attr("value", "");
	$("#leasePayMoney").attr("value", "");
	$("#leaseFineMoney").attr("value", "");
	$("#leaseTime").attr("value", "");
	$("#leaseStartTime").attr("value", "");
	$("#leaseEndTime").attr("value", "");
	$("#placeName").attr("value", "");
	$("#manageWay").attr("selected", -1);
	$("#arbitrationUnits").attr("value", "");
	$("#contractNum").attr("value", "");
	$("#quanZheng").attr("value", "");
	$("#chanQuanXianDing").attr("value", "");
	$("#zhengJianQiQuan").attr("value", "");
	$("#yiLiuWenTi").attr("value", "");
	$("#chanQuanJiuFen").attr("value", "");
	$("#gaiBianXingZhi").attr("value", "");
	$("#chengDanChengDan").attr("value", "");
	$("#qiYueGuiDing").attr("value", "");
	$("#shenHeWenTi").attr("value", "");
	$("#otherCondition").attr("value", "");
//	$("#addUser").attr("value", "");
	
	$("#houseID").attr("value", "");
	$("#propertyID").attr("value", "");
	$("#houseAdd").attr("value", "");
	$("#houseUse").attr("selected", -1);
	$("#houseStructrue").attr("selected", -1);
	$("#houseArea").attr("value", "");
	$("#landArea").attr("value", "");
	$("#houseOwner").attr("value", "");
	$("#IDType").attr("selected", -1);
	$("#IDNum").attr("value", "");
}
/*处理提交房屋信息
主要是为了处理返回异常 表单检测*/
function submitHouse(){
	let houseFrom = $('#houseForm');
	let tempData = houseFrom.serialize()
	let urlStr = houseFrom.attr('action');
	tempData += '&csrfmiddlewaretoken=' + $('[name = "csrfmiddlewaretoken"]').val();
	$.ajax({
		url: urlStr,
		type: 'post',
		data: tempData,
		/*headers: {"X-CSRFToken": $.cookie('csrftoken')},*/
		success: function(response){
			let resp = response;
			try{
				resp = JSON.parse(resp);
			}catch (err){
				window.location.href = '/house/'
			}
			if(resp['status'] === 300){
				alert(resp['message'])
			}else{

			}
		},
		error: function(error){
			console.log(error)
		}
	})
}
function submitOnClick(typeLabel){
	var tempData = $('#leaseForm').serialize();
	var urlStr = $('#leaseForm').attr('action');
	var dicValue;
	for(var index = 0; index < dics['leaseStatus'].length; index++){
		var tempob = dics['leaseStatus'][index];
		if(tempob.label == typeLabel){
			dicValue = tempob.id;
			break;
		}
	}
	if(urlStr == 'editLease'){
		tempData += '&leaseStatus=' + currentInfo.leaseStatus;
	}else{
		tempData += '&leaseStatus=' + dicValue;
	}
	
	$.ajax({
		url: urlStr,
		type: 'post',
		dataType: 'json',
		data: tempData,
		success:function(response){
			if(response != 'nullValue'){
				closeLeaseAddPopup();
				quaryLeaseInfos('leaseStatus=0');
			}else{
				alert('保存失败');
			}
		},
		error:function(error){
			  console.log(error);
		}
	});
	
}

function shenPionClick(typeLabel){
	//审批限制字段
	shenPiStatusArr = ['未审批', '未复审'];
	shenPiStatusIDArr = [];
	//退回限制字段
	backStatusArr = ['已审批'];
	backStatusIDArr = [];
	for(var index = 0; index < dics['leaseStatus'].length; index++){
		var tempob = dics['leaseStatus'][index];
		if(tempob.label === typeLabel){
			dicValue = tempob.id;
		}else if(shenPiStatusArr.indexOf(tempob.label) !== -1){
			shenPiStatusIDArr.push(tempob.id);
		}else if(backStatusArr.indexOf(tempob.label) !== -1){
			backStatusIDArr.push(tempob.id);
		}
	}

	if(typeLabel === '已审批' && shenPiStatusIDArr.indexOf(currentInfo.leaseStatus) === -1){
		alert('只可以审批<状态>为<未审批,未复审>的记录！')
		return
	}else if(typeLabel === '未复审' && backStatusIDArr.indexOf(currentInfo.leaseStatus) === -1){
		alert('只可以退回<状态>为<已审批>的记录！')
		return
	}

	let currentJson = JSON.stringify(currentInfo)

	$.ajax({
		url: 'shenPiLease',
		type: 'post',
		dataType: 'json',
		data: {
			'json': currentJson,
			'status': dicValue
		},
		success:function(response){
			if(response !== 'nullValue'){
				closeLeaseAddPopup();
				quaryLeaseInfos('leaseStatus=0');
			}else{
				alert('保存失败');
			}
		},
		error:function(error){
			  console.log(error);
		}
	});
}
/*查询租凭信息*/
function quaryLeaseInfos(quaryC){
	$.ajax({
		url: 'queryLeases',
		type: 'get',
		dataType: 'json',
		data: quaryC,
		success:function(response){
			console.log(response);
//			responseJson = response['leaseInfos'].replace('"', "/'")
			var responseObj = JSON.parse(response['leaseInfos']);
			updateLeaseTable(responseObj);
		},
		error:function(error){
			console.log(error);
		}
	})
}
/*搜索租凭信息按钮点击*/
function searchLeaseBtn(){
	var leaseStatusValue = $('#statusQuery').val();
	var leaseHouseIDValue = $('#serachHouseIDTxt').val();
	// var dic = {}
	// dic['leaseStatus'] = leaseStatusValue;
	// dic['houseID'] = leaseHouseIDValue;

	var dicStr = '';
	dicStr = 'leaseStatus=' + leaseStatusValue + '&houseID=' + leaseHouseIDValue;
	// var dicJson = JSON.stringify(dic);
	quaryLeaseInfos(dicStr);
}

/*更新租凭表格*/
function updateLeaseTable(leaseInfos){
	var leaseTbody = $('#leaseInformationTalbe tbody');
	var tableElm = $("#leaseInformationTalbe")[0];
	var tableHeaders = tableElm.getElementsByTagName("thead")[0].getElementsByTagName("th");
	var tableBody = tableElm.getElementsByTagName("tbody")[0];
	$(tableBody).empty();
	
	for(var index = 0; index < leaseInfos.length; index++){
		var tempTr = document.createElement("tr");
		var dataJson = leaseInfos[index].fields;
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

/*打开房屋信息添加窗口*/
function openRealtyPopup(currentObj){
	cleanRealtyAddPopup();
	if(currentObj.id == 'addRealtyBtn'){
		$('#realtyForm').attr('method', 'post');
		$('#realtyForm').attr('action', 'newRealty');
	}else if(currentObj.id == 'editRealtyBtn'){
		$('#realtyForm').attr('method', 'post');
		$('#realtyForm').attr('action', "editRealty/" + currentInfo.id + "/");
		manageRealtyPopupInfo();
	}
	$('#popupMake').show();
	$('#realtyAddDiv').show();
}
/*删除房屋数据*/
function deleteRealtyInfo(){
	r = confirm('确定删除<机构名称>为<' + currentInfo.institutionName + '>的房地产经纪机构数据吗？');
	if(r == true){
		window.location.href="deleteRealty/" + currentInfo.id + "/";
	}else{

	}
}
/*关闭房地产经纪机构信息添加窗口*/
function closeRealtyPopup(){
	cleanRealtyAddPopup();
	$('#popupMake').hide();
	$('#realtyAddDiv').hide();
//	var houseAddDiv = document.getElementById("houseAddDiv");
//	houseAddDiv.style.display = "none";
}
/*清理房地产信息*/
function cleanRealtyAddPopup(){
	$("#institutionName").attr("value", "");
	$("#lawPerson").attr("value", "");
	$("#officeAddress").attr("value", "");
	$("#certificateText").attr("value", "");
	$("#certificateNum").attr("value", "");
	$("#vilidityDateStart").attr("value", "");
	$("#vilidityDateEnd").attr("value", "");
}
/*处理房屋信息致弹窗数据*/
function manageRealtyPopupInfo(){
	for(var item in currentInfo){
		manageInputElementValue(item, currentInfo[item]);
	}
}


/*打开房屋信息添加窗口*/
function openUserPopup(currentObj){
	cleanUserAddPopup();
	let userForm = $('#userForm');
	if(currentObj.id === 'addUserBtn'){
		userForm.attr('method', 'post');
		userForm.attr('action', 'newUser/');
	}else if(currentObj.id === 'editUserBtn'){
		userForm.attr('method', 'post');
		userForm.attr('action', "editUser/" + currentInfo.id + "/");
		manageUserPopupInfo();
	}
	$('#popupMake').show();
	$('#userAddDiv').show();
//	var houseAddDiv = document.getElementById("houseAddDiv");
//	houseAddDiv.style.display = "block";
}
/*删除房屋数据*/
function deleteUserInfo(){
	r = confirm('确定删除<用户名>为<' + currentInfo.displayName + '>的用户数据吗？');
	if(r == true){
		window.location.href="deleteUser/" + currentInfo.id + "/";
	}else{

	}
}
/*关闭房屋信息添加窗口*/
function closeUserPopup(){
	cleanUserAddPopup();
	$('#popupMake').hide()
	$('#userAddDiv').hide()
}
/*处理房屋信息致弹窗数据*/
function manageUserPopupInfo(){
	for(var item in currentInfo){
		if(item === 'password'){
			continue;
		}
		manageInputElementValue(item, currentInfo[item]);
	}
}

/*清理房屋信息添加窗口*/
function cleanUserAddPopup(){
	$("#username").attr("value", "");
	$("#password").attr("value", "");
	$("#displayName").attr("value", "");
	$("#telephone").attr("value", '');
	$("#authority").attr("value", '');
}


/*通过关键字查询房屋信息*/
function getHouseInfoByKey(keyStr, valueElementIDStr){
	var valueElement = document.getElementById(valueElementIDStr)
	var csrf = $('input[name="csrfmiddlewaretoken"]').val();
	if(valueElement){
		keyV = valueElement.value;
	}else{
		keyV = valueElementIDStr;
	}
//	var token = $.cookie('csrftoken');
//	window.location.href="queryHouse/" + keyStr + "="  + valueElement.value + "/";
	$.ajax({
		url: 'queryHouse/',
		type: 'get',
		data:{     //这不是字典，是对象类型，特点，键可以不加引号
//			csrfmiddlewaretoken: csrf,
		   keyStr:keyStr,
		   keyValue:keyV
		},
		success:function(response){
			if(response == 'nullValue'){
				return;
			}
			var responseObj = JSON.parse(response);
			leaseHouseInfo = JSON.parse(responseObj['houseInfos'])[0]['fields'];
			$('#leaseHouseID').attr('value', leaseHouseInfo.houseID);
			$('#leaseHouseOwner').attr('value', leaseHouseInfo.houseOwner);
			$('#ownerIDType').attr('value', getDictLable(leaseHouseInfo.IDType, 'IDType'));
			$('#ownerID').attr('value', leaseHouseInfo.IDNum);
			$('#leaseHouseArea').attr('value', leaseHouseInfo.houseArea);
			$('#ownerPhone').attr('value', leaseHouseInfo.ownerPhone);
		},
		error:function(error){
			  console.log(error)
		}
		})
}