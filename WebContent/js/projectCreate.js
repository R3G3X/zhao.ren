$(document).ready(function() {
	var variable = "," + $("#variable").val().toString() + ",";
	if (variable == ",,")
		variable = ",";
	console.log($("#variable").val());
	console.log(variable);
	var totalWidth = 0;
	var count1 = 0;
	$('#search-box-input').keydown(function(e){
		var theEvent = e || event;
		var theEvent = e || event;
		if(e.keyCode ==188 && !e.shiftKey){
			theEvent.returnValue = false;
			theEvent.preventDefault();
			// alert(variable);
			count1 ++;
			if ($("#search-box-input").val() == "" || $("#search-box-input").val() == null){
				alert("标签不能为空");
				count1 --;
				return;
			}
			if ($("#search-box-input").val().length > 15){
				alert("标签太长");
				count1 --;
				return;
			}
			if (count1 > 5){
				alert("标签太多");
				count1 --;
				return;
			}
			var bool = variable.indexOf(',' + $("#search-box-input").val().toString() + ',');
			if(bool >= 0 ){
				$("#search-box-input").val("")
				count1 --;
				return;
			}
			var temp = $("#search-box-input").val();
			var prependElm  = "<div class=\"tag-name\">"+temp+"</div>";
			$("#search-box-inside").prepend(prependElm);
			// var width = $(".tag-name").slice(0,1).width() + 10;
			// var width = $(".tag-name").slice(0,1).width() + 10;
			// totalWidth += width;
			// width = $("#search-box-input").width() - width;
			// if (totalWidth >= 500){
			// 	$("#search-box-inside").height($("#search-box-input").height() + Math.floor((totalWidth + 2) / 514) * 52);
			// 	width = 502;
			// 	$("#search-box-input").width(width);
			// }else{
			// 	$("#search-box-input").width(width);
			// }
			variable += temp;
			variable += ",";
			$("#search-box-input").val("");
		}
	})
	$(document).on("dblclick",".tag-name",function(){
		$("#variable").val()
		// var width = $(this).width() + 10;
		// width = $("#search-box-input").width() + width;
		// // if ((totalWidth - width) / 514 < totalWidth / 514){
		// if (width > 514){
        //
		// }else{
		// 	$("#search-box-input").width(width);
		// 	totalWidth = totalWidth - width;
		// }
		var str = ',' + $(this).text().toString() + ',';
		variable = variable.replace(str, ',');
		count --;
		$(this).remove();
	})
	$(document).on("click",".tag-name",function(){
		if($(this).hasClass("clicked")){
			$(this).removeClass("clicked");
			$("#search-box-input").width($("#search-box-input").width()+2);
		}
		else{
			$(this).addClass("clicked");
			$("#search-box-input").width($("#search-box-input").width()-2);
		}
	})
	var count = 0;
	$(".project-create-post").click(function() {
		if (checkTextValid($("#projectname").val())){
			alert("项目名称中包含特殊字符");
			return;
		}
		variable = variable.substring(0,variable.length-1);
		variable = variable.substring(0+1,variable.length);
		$("#check-project-status").html("<font color='red'>添加中...</font>");
		$.post(getRootPath() + "/jsp/doCreateProject.jsp", {
			"name" : $("#projectname").val(),
			"num" : $("#projectMenRequired").val(),
			"time" : $("#projectDevelopTime").val(),
			"intro" : $("#projectDescribe").val(),
			"techs" : variable,
			"detail" : $("#projectDescribeInDetails").val(),
		}, function(data, status, xhr) {
			alert("添加成功");
			location.href="../user/personalCenter-project.jsp";
		}).error(function(data, status, e) {
			$("#check-project-status").html("<font color='red'>添加失败！请检查信息是否有误</font>");
		})
	})

	function checkTextValid(form) {
		var txt=new RegExp("[ ,\\`,\\~,\\!,\\@,\#,\\$,\\%,\\^,\\+,\\*,\\&,\\\\,\\/,\\?,\\|,\\:,\\.,\\<,\\>,\\{,\\},\\(,\\),\\',\\;,\\=,\"]");
		if (txt.test(form)){
				return true;
		}
		return false;
	}

	$(".project-save-post").click(function() {
		variable = variable.substring(0,variable.length-1);
		variable = variable.substring(0+1,variable.length);
		$("#check-project-status").html("<font color='red'>添加中...</font>");
		$.post(getRootPath() + "/jsp/doEditProject.jsp", {
			"pid" : id,
			"name" : $("#projectname").val(),
			"num" : $("#projectMenRequired").val(),
			"time" : $("#projectDevelopTime").val(),
			"intro" : $("#projectDescribe").val(),
			"techs" : variable,
			"detail" : $("#projectDescribeInDetails").val(),
		}, function(data, status, xhr) {
			alert("修改成功");
			location.href="../user/personalCenter-project.jsp";
		}).error(function(data, status, e) {
			$("#check-project-status").html("<font color='red'>修改失败！请检查信息是否有误</font>");
		})
	})
	$(".lable").click(function(){
		if($(this).attr("id")=="0"){
			$(this).removeClass("label-default").addClass("label-primary").attr("id","1");
			count += Number($(this).parent().attr("id"));
		}else{
			$(this).removeClass("label-primary").addClass("label-default").attr("id","0");
			count -= Number($(this).parent().attr("id"));
		}
	})
})
