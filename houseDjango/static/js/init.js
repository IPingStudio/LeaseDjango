// JavaScript Document
var inited = false;	
function init(){
	if(inited){
		return;
	}else{
		inited = true;
	}
	setButtonElement();
	setDict();
	setCurrentInfo();
}

/*处理字典字段*/
function setDict(){
	var dictElement = document.getElementById('dictsData');
	ElementData = dictElement.getAttribute('data');
	dics = $.parseJSON(ElementData.replace(/'/g, '\"'));
	setSelectElement('houseUse', 'houseUse');
	setSelectElement('houseStructure', 'houseStructure');
	setSelectElement('IDType', 'IDType');
	setSelectElement('propertyType', 'propertyType');
	setSelectElement('holderIDType', 'IDType');
	setSelectElement('manageWay', 'operationType');
	setSelectElement('statusQuery', 'leaseStatus');
}
/*处理房屋信息*/
function setCurrentInfo(){
	infoData = $.parseJSON($('#infoData').attr('data').replace(/'/g, '\"'));
	for(var index = 0; index < infoData.length; index++){
		infoData[index]['fields']['id'] = infoData[index]['pk'];
	}
	if(modelName == 'house'){
		manageHouseInfoData();
	}else if(modelName == 'lease'){
		manageLeaseInfoData();
	}else if(modelName == 'realty'){
		manageRealtyInfoData();
	}else if(modelName === 'user'){
		manageUserInfoData();
	}
	
}
/*动态处理下拉菜单*/
function setSelectElement(id, type){
	var currentE = document.getElementById(id);
	if(!currentE){
		return;
	}
	var dicts = dics[type];
	if(!dicts){
		return;
	}
	var tempOp = document.createElement('option');
	if(currentE.getAttribute('type') == 'searchSelect'){
		tempOp.innerHTML = "全部";
	}else{
		tempOp.innerHTML = "请输入...";
	}
	tempOp.value = -1;
	currentE.append(tempOp);
	for(var index = 0; index < dicts.length; index++){
		tempOp = document.createElement('option');
		tempOp.innerHTML = dicts[index].label;
		tempOp.value = dicts[index].id;
		currentE.append(tempOp);
	}
}

/*根据字典ID显示字段*/
function getDictLable(id, type){
	var dicts = dics[type];
	for(var index = 0; index < dicts.length; index++){
		if(dicts[index].id == id){
			return dicts[index].label;
		}
	}
	return "";
}

function setButtonElement(event){
	if(modelName == 'house'){
		$('#editHouseBtn').attr('disabled', 'disabled');
		$('#delHouseBtn').attr('disabled', 'disabled');
	}else if(modelName == 'lease'){
		$('#viewLeaseBtn').attr('disabled', 'disabled');
		$('#payBtn').attr('disabled', 'disabled');
		$('#editLeaseBtn').attr('disabled', 'disabled');
		$('#logOutBtn').attr('disabled', 'disabled');
		$('#shenPiBtn').attr('disabled', 'disabled');
		$('#backBtn').attr('disabled', 'disabled');
		$('#dayinBtn').attr('disabled', 'disabled');
		$('#imageBtn').attr('disabled', 'disabled');
	}else if(modelName == 'realty'){
		$('#editRealtyBtn').attr('disabled', 'disabled');
		$('#delRealtyBtn').attr('disabled', 'disabled');
		$('#printRealtyBtn').attr('disabled', 'disabled');
	}else if(modelName == 'user'){
		$('#editUserBtn').attr('disabled', 'disabled');
		$('#delUserBtn').attr('disabled', 'disabled');
	}
}