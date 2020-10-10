// JavaScript 

/*var wdapp;
var wddoc;
var range;
var idTmr = "";

function viewToWord(str) { //str传递的参数格式可为（X,Y,Z）
  var myary = new Array();
  myary = str.split(',');
  //获取web应用的根目录
  var url = window.location.toString();
  var pos = url.indexOf('apply');

  url = url.substring(0, pos);

  try {
    //获取Word 过程
    //请设置IE的可信任站点
    wdapp = new ActiveXObject("Word.Application");
  } catch (e) {
    alert("无法调用Office对象，请确保您的机器已安装了Office并已将本系统的站点名加入到IE的信任站点列表中！");
    //wdapp.quit();
    wdapp = null;
    return;
  }
  //wdapp.visible = true;
  //wdapp.Application.Activate();

  wdapp.Documents.Open(url + "template/applyTmp.doc"); //打开word模板url
  //wdapp.Documents.add(url + "template/applyTmp.doc");//打开word模板url
  wddoc = wdapp.ActiveDocument;

  range = wddoc.Bookmarks("manager").Range; //word模板中标签为manager对象
  range.Text = myary[1]; //给标签为manager对象赋值（追加）
  range = wddoc.Bookmarks("date").Range;
  range.Text = myary[2];
  range = wddoc.Bookmarks("content").Range;
  range.Text = myary[3];

  //wdapp.ActiveDocument.ActiveWindow.View.Type = 3;

  //wdapp.visible = false;//word模板是否可见


  wddoc.saveAs("c:\\apply_temp.doc"); //保存临时文件word

  wdapp.Application.Printout(); //调用自动打印功能

  wdapp.quit();
  wdapp = null;

  //idTmr = window.setInterval("cleanUp();",1);
}*/

function startPrint(){
	$.ajax({
        url: '/print/printLease/',
        type: 'post',
        dataType: 'html',
        data:{
            leaseID: currentInfo.id,
            printType: $('#printType').val(),
            templateID:$('#printTemplate').val()
        },
        success:function (response){
            var newWindows = window.open('', '_blank');
            newWindows.document.write(response);
            newWindows.print();
        },
        error:function (error){

        }
    })
}

function startPrintRealty(){
	$.ajax({
        url: '/print/printRealty/',
        type: 'post',
        dataType: 'html',
        data:{
            realtyID: currentInfo.id,
            printType: $('#printType').val(),
            templateID:$('#printTemplate').val()
        },
        success:function (response){
            var newWindows = window.open('', '_blank');
            newWindows.document.write(response);
            newWindows.print();
        },
        error:function (error){

        }
    })
}
