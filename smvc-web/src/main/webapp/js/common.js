/**
 *  重写 表单通用    验证框架 错误提示 方式
 **/
$.validator.setDefaults({
	submitHandler: function(from) {  },
	//errorElement: "",
	errorPlacement: function(error, element) {
		if(element.parent("div").attr("flag-pLv") == 2){
			// 移除 叉叉
			if(element.parent("div").parent("div").children("span_e")){
				element.parent("div").parent("div").children("span_e").remove();
			}
			// 移除 勾勾
			if(element.parent("div").parent("div").children("label_e")){
				element.parent("div").parent("div").children("label_e").remove();
			}
			// 添加 叉叉
			element.parent("div").parent("div").append(
				'<span_e>' +
				'&nbsp;&nbsp;&nbsp;<i class="ace-icon fa fa-times-circle" style="color: #d68273"></i>&nbsp;' +
				'</span_e>'
			);
			// 添加 错误信息
			error.appendTo( element.parent("div").parent("div") );
		}else{
			// 移除 叉叉
			if(element.parent("div").children("span_e")){
				element.parent("div").children("span_e").remove();
			}
			// 移除 勾勾
			if(element.parent("div").children("label_e")){
				element.parent("div").children("label_e").remove();
			}
			// 添加 叉叉
			element.parent("div").append(
				'<span_e>' +
				'&nbsp;&nbsp;&nbsp;<i class="ace-icon fa fa-times-circle" style="color: #d68273"></i>&nbsp;' +
				'</span_e>'
			);
			// 添加 错误信息
			error.appendTo( element.parent("div") );
		}
		//console.log(element);
	},
	success: function(label) {

		if(label.parent("div").attr("flag-pLv") == 2 ){
			// 添加 勾勾
			label.parent("div").parent("div").append(
				'<label_e>' +
				'&nbsp;&nbsp;&nbsp;<i class="ace-icon fa fa-check-circle" style="color: #8bad4c"></i></label_e>'
			);

			// 移除 叉叉
			if(label.parent("div").parent("div").children("span_e")){
				label.parent("div").parent("div").children("span_e").remove();
			}

			// 移除 错误信息
			label.remove();
		}else{
			// 添加 勾勾
			label.parent("div").append(
				'<label_e>' +
				'&nbsp;&nbsp;&nbsp;<i class="ace-icon fa fa-check-circle" style="color: #8bad4c"></i></label_e>'
			);

			// 移除 叉叉
			if(label.parent("div").children("span_e")){
				label.parent("div").children("span_e").remove();
			}
			/* //移除 勾勾
			 if(label.parent("div").children("i")){
			 label.parent("div").children("i").remove();
			 }*/

			// 移除 错误信息
			label.remove();
		}
		//console.log(label.type);
	}

});

function myConfirm (confirmStr , callback){
	if(!callback){
		callback = function (){};
	}
	bootbox.confirm({
		message: confirmStr,
		buttons: {
			confirm: {
				label: "确认",
				className: "btn-primary btn-sm"
			},
			cancel: {
				label: "取消",
				className: "btn-sm"
			}
		},
		callback: function(result) {
			if(result) callback();
		}
	});
}

function myConfirmTwo (confirmStr,callback,callmain){
	if(!callback){
		callback = function (){};
	}
	if(!callmain){
		callmain = function (){};
	}
	bootbox.confirm({
		message: confirmStr,
		buttons: {
			confirm: {
				label: "确认",
				className: "btn-primary btn-sm"
			},
			cancel: {
				label: "取消",
				className: "btn-sm"
			}
		},
		callback: function(result) {
			if(result){
				callback();
			}else{
				callmain();
			}
		}
	});
}


/**
 * jquery gritter
 * 使用前 先引入 js
 *
 <script src="$contextPath/ace/js/jquery.gritter.min.js"></script>
 ***/
/**
 * jquery gritter  ---------------   成功
 * 参数描述：
 * content 内容： 必填  title 标题：默认 = 操作提示  time 定时消失： 默认1000 单位毫秒
 * #* location 位置： 默认右上， 1：中间 *#
 */
function myGritterSuccess(content , title , time ) {
	if(title == null || title==''){ title = '操作提示'; }
	if(time == null || time==''){ time = 1000; }
	$.gritter.add({
		title: title,
		text: content,
		time: time,
		class_name: 'gritter-success gritter-center gritter-light '
	});
}
/**
 * jquery gritter  ---------------   错误
 * 参数描述：
 * content 内容：必填    title 标题：默认=错误提示    time 定时消失： 默认1000 单位毫秒
 */
function myGritterError(content , title , time ) {
	if(title == null || title==''){ title = '错误提示'; }
	if(time == null || time==''){ time = 1000; }
	$.gritter.add({
		title: title,
		text: content,
		time: time,
		class_name: 'gritter-error gritter-center gritter-light'
	});
}

/**
 * 应用场景： 完成   一个操作提交之后，不允许流在该页面，但又需要提示用户
 * 提示操作成功，并 多少秒内跳转
 */
function myFinishAndTurn (title , message , url){

	var close_Interval;

	var messageHtml = '<div class="modal-header">'+
				'<h4 class="modal-title green">' + title+ '</h4>' +
			'</div> '+
			'<div class="modal-body"> '+
				'<div class="bootbox-body"> '+
				message+ ' <span class="red2" id="close_countdown">5</span> 秒后跳转...' +
			'</div>'+
		'</div>';

	bootbox.dialog({
		message: messageHtml,
		buttons:
		{
			"success" :
			{
				"label" : "<i class='ace-icon fa fa-check'></i> 马上跳转",
				"className" : "btn-sm btn-success",
				"callback": function() {
					// console.log('马上跳转');
					clearInterval( close_Interval );
					location.href = url;
				}
			}
		}
	});

	$(".bootbox-close-button").remove();   // 移除 弹出框的 关闭按钮，

	close_Interval = setInterval(function(){
		var cur = $("#close_countdown").html();
		var next = parseInt(cur) - 1 ;

		$("#close_countdown").html(next);
		if(next == 0){
			//console.log('自动跳转');
			clearInterval( close_Interval );
			location.href = url;
		}
	} ,1000);
}

/**
 * 应用场景： 完成   一个操作提交之后，不允许流在该页面，但又需要提示用户
 * 提示操作成功，并 多少秒内跳转
 */
function myFinishAndTurnFn (title , message , fn){
	var close_Interval;
	var messageHtml = '<div class="modal-header">'+
		'<h4 class="modal-title green">' + title+ '</h4>' +
		'</div> '+
		'<div class="modal-body"> '+
		'<div class="bootbox-body"> '+
		message+ ' <span class="red2" id="close_countdown">5</span> 秒后跳转...' +
		'</div>'+
		'</div>';
	bootbox.dialog({
		message: messageHtml,
		buttons:
		{
			"success" :
			{
				"label" : "<i class='ace-icon fa fa-check'></i> 马上跳转",
				"className" : "btn-sm btn-success",
				"callback": function() {
					// console.log('马上跳转');
					clearInterval( close_Interval );
					fn();
				}
			}
		}
	});
	$(".bootbox-close-button").remove();   // 移除 弹出框的 关闭按钮，
	close_Interval = setInterval(function(){
		var cur = $("#close_countdown").html();
		var next = parseInt(cur) - 1 ;

		$("#close_countdown").html(next);
		if(next == 0){
			//console.log('自动跳转');
			clearInterval( close_Interval );
			fn();
		}
	} ,1000);
}

(function($){

	/**
	 * 封装 DataTable 初始化
	 * @param options
	 * @returns {*}
	 */
	$.fn.advancedDataTable = function(options){
		var $this = this;
		
		options = $.extend({}, {
			sAjaxSource: "",
			aoColumns: [],
			fnServerParams: function ( aoData ) {},
			fnDrawCallback: function(oSettings) {},
			fnHeaderCallback: function( nHead, aData, iStart, iEnd, aiDisplay ) {},
			fnInitComplete: function (oSettings, json) {},
			oLanguage: {"sUrl": ""}
		}, options);
		
		var datatable = $this.dataTable({
			"bSort": false, //去掉排序。
			"bStateSave": false, //客户端记录状态，讲状态数据写入cookies
			"bServerSide": true, //异步请求
	     	"bPaginate": true, //显示分页
	     	"bProcessing": false, //取消等待提示
	     	"bLengthChange": true, //不显示“每页显示多少条”的下拉框
	     	"bRetrieve":true, //允许重新生成表格
	     	"bAutoWidth": false, //自适应宽度
	     	"sAjaxSource": options.sAjaxSource,
	     	"sServerMethod": "GET",
	     	"bFilter": true,  //过滤功能
	     	"bInfo": true, //页脚信息
	     	"iDisplayStart": 0, 
	     	"iDisplayLength": 10,
	        "aoColumns": options.aoColumns,
	        "sDom": "rt<ip>",
	        "fnServerParams": function ( aoData ) {
	        	options.fnServerParams(aoData);
	        },
	        "fnDrawCallback": function(oSettings) {
				if($this.find('tr > th:first-child input:checkbox')[0] ){
					$this.find('tr > th:first-child input:checkbox')[0].checked = false;
					$this.find('tr > td:first-child input:checkbox').each(function(){
						this.checked = false;
					});
					options.fnDrawCallback(oSettings);
				}
				$this.find("a[data-rel=tooltip]").tooltip({container:'body'});
	        },
			"fnHeaderCallback": function( nHead, aData, iStart, iEnd, aiDisplay ) {
				options.fnHeaderCallback( nHead, aData, iStart, iEnd, aiDisplay );
			},
			"fnInitComplete": function (oSettings, json) {
				options.fnInitComplete(oSettings, json);
			},
	        "oLanguage": options.oLanguage
	    });

		$this.on('click', 'tr > th:first-child input:checkbox' , function(){
			var checked = this.checked;
			$this.find('tr > td:first-child input:checkbox').each(function(){
                this.checked = checked;
	        });
	    }).on('click', 'tr > td:first-child input:checkbox' , function(){
	    	var totalCount = $this.find('tr > td:first-child input:checkbox').length;
	    	var selectCount = $this.find('tr > td:first-child input:checkbox:checked').length;
	    	$this.find('tr > th:first-child input:checkbox')[0].checked = (totalCount==selectCount);
	    });
		
		datatable.getSelectedData = function(){
			var selectedData = [];
			$this.find('tr > td:first-child input:checkbox:checked').each(function(){
				selectedData.push(datatable.fnGetData($(this).closest('tr')));
			});
			return selectedData;
		};
		
		return datatable;
	};

})(jQuery);

jQuery.extend(jQuery.validator.messages, {
	  required: "必选字段",
	  remote: "请修正该字段",
	  email: "请输入正确格式的电子邮件",
	  url: "请输入合法的网址",
	  date: "请输入合法的日期",
	  dateISO: "请输入合法的日期 (ISO).",
	  number: "请输入合法的数字",
	  digits: "只能输入整数",
	  creditcard: "请输入合法的信用卡号",
	  equalTo: "请再次输入相同的值",
	  accept: "请输入拥有合法后缀名的字符串",
	  maxlength: jQuery.validator.format("请输入一个长度最多是{0}的字符串"),
	  minlength: jQuery.validator.format("请输入一个长度最少是{0}的字符串"),
	  rangelength: jQuery.validator.format("请输入一个长度介于{0}和{1}之间的字符串"),
	  range: jQuery.validator.format("请输入一个介于 {0}和 {1}之间的值"),
	  max: jQuery.validator.format("请输入一个最大为{0}的值"),
	  min: jQuery.validator.format("请输入一个最小为{0}的值")
});

$(function(){
	$("form :input").keydown(function(e){
		if(e.keyCode==13){
			var $form = $(this).closest("form");
			if(!$form) return;
			
			var formid = $form.attr("id");
			if(formid){
				$("."+formid+"_submit").click();
				return;
			}
			
			var formname = $form.attr("name");
			if(formname){
				$("."+formname+"_submit").click();
				return;
			}
		}
	});
});

$(document).ready(function () {
	var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var bashPath = localhostPaht + projectName;
	    
	//全局配置
    $.ajaxSetup({
        //type: "POST", //用 POST 代替默认 GET 方法
        //cache: false, //禁止AJAX缓存，开发模式下设置为false
        timeout: 60000, //请求超市时间（1分钟）
        statusCode: {
            404: function () {
                alert('页面不存在');
            },
            500: function () {
                alert('服务器内部错误');
            },
            405: function () {
                alert('没有权限');
            },
            301: function (data, textStatus) { // session超时，或者用户未登录，跳转到登录页面
                alert(data.responseText);
                window.location.href = bashPath + '/index';
                /*setTimeout(function () {
                    window.location.href = bashPath + '/index';
                }, 2000);*/
            }
        }
    });
});


/**
 *@see 根据当前节点  判断该节点下的子节点是选中还是不选中
 * @param treeId ztree的id
 * @param treeNode 当前选中的节点
 * @author dengxi
 */
function checkZtreeChildren(treeId, treeNode){

    checkchildren(treeId, treeNode);
    if(!treeNode.checked){
        uncheckChildren(treeId, treeNode);
    }
}

/**
 *@see 根据当前节点  该节点下的子节点不选中
 * @param treeId
 * @param treeNode
 */
function uncheckChildren(treeId, treeNode){
    var zTree = $.fn.zTree.getZTreeObj(treeId);
    if(treeNode.children&&treeNode.children.length>0){
        var currentNode='';
        for(var b=0;b<treeNode.children.length;b++){
            currentNode=treeNode.children[b];
            if(currentNode.children&&currentNode.children.length>0){
                uncheckChildren(treeId, currentNode);
            }
            zTree.checkNode(currentNode);
        }
    }
}

/**
 *@see 根据当前节点  该节点下的子节点选中
 * @param treeId
 * @param treeNode
 */
function checkchildren(treeId, treeNode){
    var zTree = $.fn.zTree.getZTreeObj(treeId);

    if(treeNode.children&&treeNode.children.length>0){
        var currentNode='';
        for(var b=0;b<treeNode.children.length;b++){
            currentNode=treeNode.children[b];
            if(currentNode.children&&currentNode.children.length>0){
                checkchildren(treeId, currentNode);
            }
            zTree.checkNode(currentNode, true, true);
        }
    }
    zTree.cancelSelectedNode();
}

function changeTreeCss(treeId, treeNode){
    if(treeNode.children&&treeNode.children.length>0){
        var currentNode='';
        for(var b=0;b<treeNode.children.length;b++){
            currentNode=treeNode.children[b];
            if(currentNode.children&&currentNode.children.length>0){
                changeTreeCss(treeId, currentNode);
            }
            if(currentNode.type=='org'&&!currentNode.children){
                currentNode.icon="org";
            }
        }
    }
}

