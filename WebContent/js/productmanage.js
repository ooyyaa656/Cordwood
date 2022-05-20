function deleteitem(form){
	var str = "";
        var a="";
	var check = document.getElementsByName("checkList");
        a=eval("document."+form);
	for (var i=0; i<check.length; i++) {
			if (check[i].checked == true){
			str = str + check[i].value + ",";
			}
	}
        a.checkValue.value = str;
	if(str == "") {
		alert("删除时至少选择一项");
		return;
	}
	if (confirm("确定要删除吗?")) {
		eval(form+".submit()");
	}
}
function lockitem(form){
	var str = "";
        var a="";
	var check = document.getElementsByName("checkList");
        a=eval("document."+form);
	for (var i=0; i<check.length; i++) {
			if (check[i].checked == true){
			str = str + check[i].value + ",";
			}
	}
        a.checkValue.value = str;
	if(str == "") {
		alert("锁定时至少选择一项");
		return;
	}
	if (confirm("确定锁定吗?")) {
		eval(form+".submit()");
	}
}function unlockitem(form){
	var str = "";
        var a="";
	var check = document.getElementsByName("checkList");
        a=eval("document."+form);
	for (var i=0; i<check.length; i++) {
			if (check[i].checked == true){
			str = str + check[i].value + ",";
			}
	}
        a.checkValue.value = str;
	if(str == "") {
		alert("解锁时至少选择一项");
		return;
	}
	if (confirm("确定开放吗?")) {
		eval(form+".submit()");
	}
}
function builditem(form){
	var str = "";
        var a="";
	var check = document.getElementsByName("checkList");
        a=eval("document."+form);
	for (var i=0; i<check.length; i++) {
			if (check[i].checked == true){
			str = str + check[i].value + ",";
			}
	}
        a.checkValue.value = str;
	if(str == "") {
		alert("至少选择一项");
		return;
	}
	if (confirm("确定已建吗?")) {
		eval(form+".submit()");
	}
}
function checkAll(name) {
   var el = document.getElementsByTagName('input');
   var len = el.length;
   for(var i=0; i<len; i++)     {
     if((el[i].type=="checkbox") && (el[i].name==name))         {
     el[i].checked = true;         }     } }
function clearAll(name) {
  var el = document.getElementsByTagName('input');
  var len = el.length;
  for(var i=0; i<len; i++)     {
    if((el[i].type=="checkbox") && (el[i].name==name))         {
      el[i].checked = false;         }     } }
