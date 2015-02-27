jQuery(function($) {

    var tree;
    tree = initOrgTree( 'treeview' ,'../../sys/organization/orgUserTreeData' ,true, function (){
        /*设置 view 和hidden
          * */
        if(tree.selectedItems().length > 0){
            var usernamesarr = "";
            var useridarr = "";
            var treeSarr = tree.selectedItems();

            $.each(treeSarr,function(i,item){
                if(item.datatype === "user"){
                    clickAddressBookFillAutoComplete2(item.name,item.id);
                }
            });
        }else{
            myGritterError("请选择人员");
        }
    } , null ,null);

    function dateModify(str){ //时间字符串修改
        if(str){
            var result = str.substr(0,19);
            return  result;
        }
        return "";
    }


	var boxtype = 2;
	var startSize = 0 ;
	var pageSize = 10;
	var queryEmailItemsFunc = function queryEmailItems(id,boxtype,startSize,pageSize) {
        $.ajax({
            url: "queryEmailItems?random="+parseInt(Math.random()*100000),
            timeout: 30000,
            data:{
            		boxtype:boxtype,
            		startSize:startSize,
            		pageSize:pageSize
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (textStatus == "timeout") { // 请求超时
                    myGritterError("请求超时");
                }
                else{
                    myGritterError("服务器故障："+errorThrown);
                }
            },
            success: function (data, textStatus) {
            	var mailsstr = "";
                if (textStatus == "success") { // 请求成功
                	
                	if(data!=null){
                		
                		showPage(data)
                		
                		var mails = data.data;
                		
                		if(mails!=null){
                			 for(var i = 0 ; i < mails.length;i++){
                				 var unreadclass = "";
                				 var message_starClass="";
                				 if(mails[i].readstate == 0){
                					 unreadclass = unreadclass = "message-unread";
                					 message_starClass = "class='message-star ace-icon fa fa-star orange2'";
                				 }
                				 
                				 mailsstr = mailsstr + 
            	            		"<div class='message-item  "+unreadclass+"'>"+
            							"<label class='inline'>"+
            								"<input type='checkbox'  class='ace' />"+
            								"<span class='lbl'></span>"+
            							"</label>"+
            							"<i "+message_starClass+"></i>"+
            							"<input  class='mailid' type='hidden' value="+mails[i].mailid+"></input>"+
            							"<input class='userid' type='hidden' value="+mails[i].userid+"></input>"+
            							"<span class='sender' title="+mails[i].username+">"+mails[i].username+"</span>"+
            							"<span class='time'>"+dateModify(mails[i].createdate)+"</span>"+
            							"<span><span class='summary text'>"+mails[i].mailtitle+"</span></span>"+
            						"</div>"
                				 
                			 }
                		}
                		
                		$("#"+id).children("div.message-item").remove(); 
                		$("#"+id).append(mailsstr);
                		mailsstr = "";
                	}

                }


                var flag=url.substr(url.indexOf("=")+1,5);
                 if(flag=='inbox'){
                    var mailId=url.substr(url.indexOf("&")+8,url.length);
                    var obj=$("input[type=hidden][value="+mailId+"]");
                    if (obj.parent().find('.message-item').length>=0){

                     if(obj.find(".message-inline-open").length>0){
                     obj.find(".message-inline-open").removeClass('message-inline-open').find('.message-content').remove();
                     }

                     var mailid = mailId;
                     var mailState;

                     if(obj.parent().find('message-unread').length>=0){
                     mailState = 0;
                     }
                     else{
                     mailState = 1;
                     }
                     queryMailContent(obj,mailid,mailState);

                     }
                }
            }
        });
    };
    
    
    /**
     * 显示分页工具栏的分页数
     */
    function showPage(page){
    	if(page!=null){
    		$(".message-footer").children(".pull-left").empty().text("邮件总数("+page.totalSize+")");
    		$(".message-footer").children(".pull-right").children("div").empty().text("邮件页数("+page.totalPage+")");
    		
    		$(".message-footer").children(".pull-left").append(
    				"<input id='page_totalPage' type= 'hidden' value = "+page.totalPage+"/> "+
    				"<input id='page_currentPage' type= 'hidden'  value = "+page.currentPage+"/> "
    		)
    		
    	}
    };




    //获取成员列表
    function getMembers(){
        $.ajax({
            url: "getMessageMembers?random="+parseInt(Math.random()*100000),
            dataType: 'json',
            success: function (data) {
                var ops = "";
                if(data.length>0){
                    for (var tab in data) {
                        ops += "<li style='border-left: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc;'><a class='address_book' href='#' id="+data[tab].operid+" name="+data[tab].name+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[tab].name+"</a></li>";
                    }
                }
                else{
                    ops = "<li style='border-left: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc;'>暂无人员</li>";
                }
                $("#mail_membersList").empty().append(ops);
            }
        });
    };


    /**
     * 回复、填充自动完成
     */
    function clickAddressBookFillAutoComplete(username,userid){
            var tempUserId = $("#form-field-recipient_id").val();
            var tempUserName = !!$("input[name='recipient']").attr("value")===false?"":$("input[name='recipient']").attr("value");
            var nowUserid = userid+",";
            var nowUserName = username+", ";

            if(tempUserId.indexOf(nowUserid) >=0){
                tempUserId = tempUserId.replace(nowUserid,"");
                tempUserName = tempUserName.replace(nowUserName,"");
            }
            $("#form-field-recipient_id").val(tempUserId+nowUserid);
            $("input[name='recipient']").attr("value",tempUserName+nowUserName);

            $("input[name='recipient']").val(tempUserName+nowUserName);

            if(userid!=$("#push_userid")[0].innerHTML) {
                saveMemberToAddressBook(userid);
            }

    };


    function clickAddressBookFillAutoComplete2(username,userid){
        var tempUserId = $("#form-field-recipient_id").val();
        var tempUserName = !!$("input[name='recipient']").attr("value")===false?"":$("input[name='recipient']").attr("value");
        var nowUserid = userid+",";
        var nowUserName = username+", ";

        if(tempUserId.indexOf(nowUserid) >=0){
            tempUserId = tempUserId.replace(nowUserid,"");
            tempUserName = tempUserName.replace(nowUserName,"");
        }
        $("#form-field-recipient_id").val(tempUserId+nowUserid);
        $("input[name='recipient']").attr("value",tempUserName+nowUserName);

        $("input[name='recipient']").val(tempUserName+nowUserName);
    };



    /**
     * 点击通讯录，人员进入邮件接收人输入框中
     */
    $("#mail_membersList").click(function(e){
        if(e.target.nodeName.toLowerCase()==="a"){
            var username = (e.target.innerHTML).replace("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "");
            var userid = e.target.id;

            if(userid && userid!="null"){
                clickAddressBookFillAutoComplete(username,userid);
            }
            else{
                myGritterError("非系統成员不能成为收件人!",'提示',2000);
            }
        }
    });


    /**
     * 点击第一页
     */
    $(".ace-icon.fa.fa-step-backward.middle").parent().parent("li").click(function(){
    	queryEmailItemsFunc("message-list",boxtype,0,pageSize);
    	$(".pagination.middle").find("input").val(1);
    });
    
    /**
     * 点击最后一页
     */
    $(".ace-icon.fa.fa-step-forward.middle").parent().parent("li").click(function(){
    	var totalPage =  parseInt($("#page_totalPage").val())  ;
    	startSize = pageSize*(totalPage-1);
    	queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
    	$(".pagination.middle").find("input").val(totalPage);
    });
    
    /**
     * 点击下一页
     */
    $(".ace-icon.fa.fa-caret-right.bigger-140.middle").parent().parent("li").click(function(){
        if( $(".ace-icon.fa.fa-caret-left.bigger-140.middle").parent().parent("li").hasClass("disabled")){
            $(".ace-icon.fa.fa-caret-left.bigger-140.middle").parent().parent("li").removeClass("disabled");
        }
        var currentPage = parseInt($("#page_currentPage").val()) ;
        var totalPage =  parseInt($("#page_totalPage").val())  ;

        if(parseInt($(".pagination.middle").find("input").val())===totalPage){
            $(this).addClass("disabled");
            return false;
        }

        if(currentPage<totalPage){
            currentPage = currentPage+1;
        }
        else{
            currentPage = totalPage;
        }
        startSize = pageSize*currentPage;
        queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
        $(".pagination.middle").find("input").val(currentPage+1);
    });
    
    /**
     * 点击上一页
     */
    $(".ace-icon.fa.fa-caret-left.bigger-140.middle").parent().parent("li").click(function(){
        if( $(".ace-icon.fa.fa-caret-right.bigger-140.middle").parent().parent("li").hasClass("disabled")){
            $(".ace-icon.fa.fa-caret-right.bigger-140.middle").parent().parent("li").removeClass("disabled");
        }

        var currentPage = parseInt($("#page_currentPage").val());
        var totalPage  = parseInt($("#page_totalPage").val())  ;

        if(currentPage>1){
            currentPage = parseInt($("#page_currentPage").val());
        }
        else{
            currentPage = 1;
        }

        startSize = pageSize*(currentPage-1);
        queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
        $(".pagination.middle").find("input").val(currentPage);
        if(parseInt($(".pagination.middle").find("input").val())===1){
            $(this).addClass("disabled");
            return false;
        }
    });
    



    /**
     * 数字输入区 按回车键
     */
    $(".pagination.middle").find("input").bind('keydown', function (e) {
    	var currentPage = parseInt($(this).val()) ;
    	var totalPage =  parseInt($("#page_totalPage").val())  ;
    	if(currentPage>totalPage){
    		currentPage = totalPage;
    	}
    	else if(currentPage<1){
    		currentPage = 1;
    	}
    	startSize = pageSize*(currentPage-1);
        var key = e.which;
        if (key == 13) {
            e.preventDefault();
           queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
        }

    });
    
    
    
    
    
    /**
     * 查询未读邮件函数
     */
	var queryUnReadCountEmailFunc = function queryUnReadCountEmail(id) {
        $.ajax({
            url: "queryUnReadCountEmail?random="+parseInt(Math.random()*100000),
            timeout: 30000,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (textStatus == "timeout") { // 请求超时
                    myGritterError("请求超时");
                }
                else{
                    myGritterError("服务器故障："+errorThrown);
                }
            },
            success: function (data, textStatus) {
            	var mailsstr = "";
                if (textStatus == "success") { // 请求成功
                	
                	if(data!=null){
                		var unreadtotals = data.totals;
                		$("#"+id).children("span.grey").text("("+ unreadtotals+" 封未读)");
                	}

                }
            }
        });
    };
    
    
      function split( val ) {
        return val.split( /,\s*/ );
      }
      
      function extractLast( term ) {
        return split( term ).pop();
      }
      
      /**
       * 人员下拉选择
       */
      $( "#form-field-recipient" )
        .bind( "keydown", function( event ) {
//          if ( event.keyCode === $.ui.keyCode.TAB && $( this ).autocomplete( "instance" ).menu.active ) {
//            event.preventDefault();
//          }
          if(event.keyCode===8){
              var termname = this.value;
              var termids = $("#form-field-recipient_id").val();
        	  var termnamearr =   termname.substring(0,termname.length-2).split(",");
        	   termnamearr.pop();
        	   var tnarr = termnamearr.join(", ")+", "
        	  var termid_result =  termids.substring(0,termids.length-2).split(",");
        	  termid_result.pop();
        	  var tidarr = termid_result.join(",");
              this.value = tnarr;

              if($.trim(tnarr)===","){
                  $("input[name=recipient]").attr("value","");
                  $("input[name=recipient]").val("");
                  tnarr ="";
              }

              $( "#form-field-recipient").val(tnarr);
        	  $("#form-field-recipient_id").val(tidarr+",");
              $( "#form-field-recipient").attr("value",tnarr);

          }
        }).autocomplete({
              autoFocus: true,
              source: function( request, response ) {
                  $.ajax({
                      url: "queryEmailReceiveOperater?random="+parseInt(Math.random()*100000),
                      data:{ username: extractLast( request.term )},
                      timeout: 30000,
                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          if (textStatus == "timeout") { // 请求超时
                              myGritterError("请求超时");
                          }
                          else{
                              myGritterError("服务器故障："+errorThrown);
                          }
                      },
                      success: function (data, textStatus) {
                          if (textStatus == "success") { // 请求成功
                              if(data!=null){
                                  response($.map(data.data, function(item) {
                                      return {
                                          id:item.id,
                                          label: item.label,
                                          value: item.label
                                      }
                                  }));

                              }
                          }
                      }
                  });
              },
              search: function() {
                  var term = extractLast( this.value );
                  if (term.length && term.length < 1 ) {
                      return false;
                  }
              },
              focus: function(event, ui) {
                  return false;
              },
              select: function( event, ui ) {
                  if(ui && ui.item){
                      clickAddressBookFillAutoComplete(ui.item.value,ui.item.id);
                  }
                  return false;
              }
          });

//    queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
//    queryUnReadCountEmailFunc("id-message-infobar");
	
	// handling tabs and loading/displaying relevant messages and forms
	// not needed if using the alternative view, as described in docs
	$('#inbox-tabs a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        $(".pagination.middle").find("input").val(1);
        startSize = 0 ;
        pageSize = 10;
        Inbox.select_none();
        $("#message-list").empty();
        newMail(e);
	});


    /**
     * 新邮件
     * @param e
     * @param flag
     */
    function newMail(e,flag){

        var currentTab= $(e.target).data('target');
        if(currentTab==undefined){
            currentTab = flag;
        }

        if (currentTab === 'write') {
            Inbox.show_form();

            $("#form-field-recipient_id").val("");
            $("input[name=recipient]").attr("value","");
            $("input[name=recipient]").val("");

            $("#my_file_area").empty().append("<dl class='dl-horizontal' id='upload_file_dl'>" +
                "<dt>文件上传</dt>" +
                " <dd class=''>" +
                "<form action='../../upload/main'  class='dropzone form-horizontal col-xs-10' id='dropzone'>" +
                "<div class='fallback'>" +
                " <input name='file' type='file' multiple='' />" +
                " </div>" +
                " </form>" +
                "</dd>" +
                "</dl>");

            $("#dropzone").dropzone({
                paramName: "file", // The name that will be used to transfer the file
                maxFilesize: 2, // MB
                addRemoveLinks : true,
                dictDefaultMessage :   '<span class="bigger-150 bolder"><i class="ace-icon fa fa-caret-right red"></i> 拖文件到此处</span> 上传 \
                        <span class="smaller-80 grey">(或者点击我)</span> <br /> \
                        <i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>'
                ,
                dictResponseError: '上传文件时发生错误!',
                //change the previewTemplate to use Bootstrap progress bars
                previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  " +
                    "<div class=\"dz-details\">\n    " +
                    "<div class=\"dz-filename\"><span data-dz-name></span></div>\n    " +
                    "<div class=\"dz-size\" data-dz-size></div>\n    " +
                    "<img data-dz-thumbnail />\n  </div>\n  " +
                    "<div class=\"progress progress-small progress-striped active\">" +
                    "<div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  " +
                    "<div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  " +
                    "<div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
                ,
                removedfile:function(data){
                    var jsonarr ;

                    if(typeof $("#my_file_area_url").val() === "string"){
                        if($("#my_file_area_url").val()!=""){
                            jsonarr = $.parseJSON($("#my_file_area_url").val());
                        }
                    }

                    var tempName = data.name;
//                    var tempDel = data.xhr.response+",";

                    if(jsonarr != undefined){
                        $.each(jsonarr, function (i, n)
                        {
                            if(n[0].filename === tempName){
                                jsonarr.splice(i,1);
                            }
                        });

                        $("#my_file_area_url").val( JSON.stringify(jsonarr))
                    }

                    $(".dz-filename").each(function(){
                        if(this.innerText === data.name){
                            $(this.parentNode.parentNode).remove();
                        }
                    });

                },
                success: function (data) {
                    var  jsonarr;
                    if( $("#my_file_area_url").val()===""){
                        jsonarr=new Array();
                        $("#my_file_area_url").val(jsonarr)
                    }
                    else{
                        if(typeof $("#my_file_area_url").val() === "string"){
                            jsonarr = $.parseJSON($("#my_file_area_url").val());
                        }
                    }

                    var jsonobj = {
                        filename : data.name,
                        size:Math.ceil(data.size/1024),
                        suffix:data.name.split(".")[1],
                        fileurl : data.xhr.response
                    }
                    jsonarr.push([jsonobj])
                    JSON.stringify(jsonarr)
                    $("#my_file_area_url").val( JSON.stringify(jsonarr)) ;
                    return data.previewElement ? data.previewElement.classList.add("dz-success") : void 0;
                }
            });

            if(!$("#li_new_mail").hasClass("active")){
                $("#li_new_mail").addClass("active")
            }

        } else if (currentTab == 'inbox') {
            if(!$("#li_mail_receivebox").hasClass("active")){
                $("#li_mail_receivebox").addClass("active")
            }
            $('.message-infobar').removeClass('hide');
            boxtype = 2;
            Inbox.show_list();
            queryUnReadCountEmailFunc("id-message-infobar");
            queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
        }
        else if (currentTab == 'sent') {
            if(!$("#li_mail_sentbox").hasClass("active")){
                $("#li_mail_sentbox").addClass("active")
            }
            $('.message-infobar').addClass('hide');
            boxtype = 1;
            Inbox.show_list();
            queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
        }
        else if (currentTab == 'draft') {
            if(!$("#li_mail_draftbox").hasClass("active")){
                $("#li_mail_draftbox").addClass("active")
            }
            boxtype = 0;
            $('.message-infobar').addClass('hide');
            Inbox.show_list();
            queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
        }
    }
	/*
	 * 点击发邮件触发
	 * */
	function clickSendMailBtnShowTools() {
		$("#id-message-new-navbar").removeClass("hide");
		$("#id-message-list-navbar").addClass('hide');
		$("#id-message-item-navbar").addClass("hide");
    };


    $("#my_file_show").click(function(){
        if( $("#my_file_area").hasClass("hide")){
            $("#my_file_area").removeClass("hide");
        }
        else{
            $("#my_file_area").addClass("hide");
        }

    });


    $("#buttom_send_btn").click(
        function(){
            sendMyMail();
        }
    );

	/**
	 * 点击邮件发送按钮  --
	 */
	$("#my_mail_send_div").click(
        function(){
            sendMyMail();
        }
    );

    function sendMyMail(){
        var userids = $("#form-field-recipient_id").val();
        var title = $("#form-field-subject").val();

        var content = $(".wysiwyg-editor").html();
        var attachmenturl = $("#my_file_area_url").val();

        if(userids === "" || userids === null || userids === undefined){
            myGritterError("请选择收件人");
            return false;
        }

        if(title === "" || content === null || title === undefined){
            myGritterError("请填写主题内容");
            return false;
        }


        if(content === "" || content === null || content === undefined){
            myGritterError("请填写邮件内容");
            return false;
        }

        if(content && content.length > 50000){
            myGritterError("邮件内容长度不能超过50000字符");
            return false;
        }

//		var tmpuserids = userids.split(",");

        if(userids!=null && userids!="" && userids!=","){
            $.ajax({
                url: "sendEmail?random="+parseInt(Math.random()*100000),
                type:"POST",
                data:{
                    userids: userids,
                    title:title,
                    content:content,
                    attachmenturl:attachmenturl
                },
                timeout: 30000,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (textStatus == "timeout") { // 请求超时
                        myGritterError("请求超时");
                    }
                    else{
                        myGritterError("服务器故障："+errorThrown);
                    }
                },
                success: function (data, textStatus) {
                    if (textStatus == "success") { // 请求成功
                        if(data!=null){

                            $("input[name=recipient]").attr("value","");

                            $("input[name=recipient]").val("");
                            $("input[name=recipient]").removeAttr("id");
                            $("#form-field-recipient_id").val("");
                            if(data.msg==0){
                                $("#my_file_area_url").val("");
                                $("#form-field-subject").val("");
                                $(".wysiwyg-editor")[0].innerHTML ="";
                                myFinishAndTurn("提示","发送成功",url.split("?")[0]+"?flag=inbox");
                            }
                        }
                    }
                }
            });
        }
        else{
            myGritterError("您输入的收件人姓名有误！");
        }
    }

    function saveMemberToAddressBook(userid){
        var arr = $(".address_book");
        var arrtemp = [];
        $.each(arr,function(i,node){
            arrtemp.push(node.id);
        });
        if($.inArray(userid, arrtemp)<0){
            var tempuserid = parseInt(userid);
            myConfirm("是否添加此人到通讯录",function(){
                $.ajax({
                    url: "saveMemberToAddressBook?random="+parseInt(Math.random()*100000),
                    data:{
                        userid:tempuserid
                    },
                    timeout: 30000,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        if (textStatus == "timeout") { // 请求超时
                            myGritterError("请求超时");
                        }
                        else{
                            myGritterError("服务器故障："+errorThrown);
                        }
                    },
                    success: function (data, textStatus) {
                        if (textStatus == "success") { // 请求成功
                            if(data!=null){
                                if(data.msg>0){
                                    myGritterSuccess("保存成功");
                                    getMembers();
                                }
                            }
                        }
                    }
                });
            });
        }

    }

	/**
	 * 点击返回按钮
	 */
	$("#div_back_btn").click(function(){
		$('.message-infobar').removeClass('hide');
		Inbox.show_list();
	});
	
	
	/**
	 * 点击保存草稿
	 */
	$(".btn-save-message").click(function(){
		$('.message-infobar').removeClass('hide');
		saveDraftMail();
	});
	
	
	function saveDraftMail(){
		var title = $("#form-field-subject").val();
		var content = $(".wysiwyg-editor").html();
        var attachmenturl = $("#my_file_area_url").val();
        $.ajax({
            url: "saveDraftEmail?random="+parseInt(Math.random()*100000),
            type:"POST",
            data:{ 
            	title:title,
            	content:content,
                attachmenturl:attachmenturl
            },
            timeout: 30000,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (textStatus == "timeout") { // 请求超时
                    myGritterError("请求超时");
                }
                else{
                    myGritterError("服务器故障："+errorThrown);
                }
            },
            success: function (data, textStatus) {
                if (textStatus == "success") { // 请求成功
                	if(data!=null){
                		if(data.msg==0){
                            $("#my_file_area_url").val("");
                            $("#form-field-subject").val("");
                            $(".wysiwyg-editor")[0].innerHTML ="";
                            myFinishAndTurn("提示","保存成功",url.split("?")[0]+"?flag=inbox");
                		}
                	}
                }
            }
        });
	};

	// basic initializations
	$('.message-list .message-item input[type=checkbox]').removeAttr('checked');
	$('.message-list')
			.on(
					'click',
					'.message-item input[type=checkbox]',
					function() {
						$(this).closest('.message-item')
								.toggleClass('selected');
						if (this.checked)
							Inbox.display_bar(1);// display action toolbar
													// when a message is
													// selected
						else {
							Inbox
									.display_bar($('.message-list input[type=checkbox]:checked').length);
							// determine number of selected messages and
							// display/hide action toolbar accordingly
						}
					});

	// check/uncheck all messages
	$('#id-toggle-all').removeAttr('checked').on('click', function() {
		if (this.checked) {
			Inbox.select_all();
		} else
			Inbox.select_none();
	});

	// select all
	$('#id-select-message-all').on('click', function(e) {
		e.preventDefault();
		Inbox.select_all();
	});

	// select none
	$('#id-select-message-none').on('click', function(e) {
		e.preventDefault();
		Inbox.select_none();
	});

	// select read
	$('#id-select-message-read').on('click', function(e) {
		e.preventDefault();
		Inbox.select_read();
	});

	// select unread
	$('#id-select-message-unread').on('click', function(e) {
		e.preventDefault();
		Inbox.select_unread();
	});

	
	/**
	 * 点击邮件标题显示邮件内容页面，同时改变此邮件状态为已读
	 * 
	 * 同时对回复、转发、删除按钮进行监听
	 *
	 */
	$('#message-list').on(
			'click',
			function(e){

                if(boxtype === 0){
                    $(".fa-reply").addClass("hide");
                }
                else{
                    if( $(".fa-reply").hasClass("hide")){
                        $(".fa-reply").removeClass("hide");
                    }
                }

				 if (e.target.parentNode.className.indexOf('message-item')>=0){

					    if($(this).find(".message-inline-open").length>0){
					    	$(this).find(".message-inline-open").removeClass('message-inline-open').find('.message-content').remove();
					    }
					 
					 	var mailid = $(e.target).parent('.message-item').find(".mailid").val();
					 	var mailState;
					 	
					 	if(e.target.parentNode.className.indexOf('message-unread')>=0){
					 		mailState = 0;
					 	}
					 	else{
					 		mailState = 1;
					 	}
					 	queryMailContent(e,mailid,mailState);
					 	
			       }
				 else if(e.target.className.indexOf('fa-reply')>=0){
					 var mailid = $(e.target).parents('.message-item.message-inline-open').find(".mailid").val();
					 var userid = $(e.target).parents('.message-item.message-inline-open').find(".userid").val();
					 var username = $(e.target).parents('.message-item.message-inline-open').find(".sender")[0].innerHTML;
					 var summary =  $(e.target).parents('.message-item.message-inline-open').find(".summary")[0].innerHTML;
					 
//					 Inbox.show_form();
					 clickSendMailBtnShowTools();
					 
		        	  
		        	  $("input[name='recipient']").attr("id",function(n,v){
		        		  v = userid + ","
		        	      return v;
		        	  });
		        	  
		        	  fillAutoComplete(username,userid);

                     if(summary.indexOf("回复")<0){
                         $("#form-field-subject").attr("value","回复:"+summary);
                     }
                     else{
                         $("#form-field-subject").attr("value",summary);
                     }

                     var mcontent = "<br><br><br><br><div class='my_line'></div>原邮件内容<br>"+$(".message-body")[0].innerHTML;
                     Inbox.show_form(mcontent);
				 }
				 else if(e.target.className.indexOf('fa-mail-forward')>=0){
					 
					 var summary =  $(e.target).parents('.message-item.message-inline-open').find(".summary")[0].innerHTML;
					 
					  var mcontent = $(".message-body")[0].innerHTML;
					 
					 Inbox.show_form(mcontent);
					 clickSendMailBtnShowTools();
		        	  
                     if(summary.indexOf("转发")<0){
                         $("#form-field-subject").attr("value","转发:"+summary);
                     }
                     else{
                         $("#form-field-subject").attr("value",summary);
                     }

				 }
				 else if(e.target.className.indexOf('fa-trash-o')>=0){
					 var mailid = $(e.target).parents('.message-item.message-inline-open').find(".mailid").val();
					 delMail(mailid);
				 }
				 else{
                     if(e.target.tagName === "A"){
//                         myGritterError("不准许直接打开链接");
                         var sFeatures = "height=600, width=810, scrollbars=yes, resizable=yes";
                         if($(e.target).attr("href").indexOf("http")>=0){
                             window.open( $(e.target).attr("href"), '临澧OA平台', sFeatures );
                         }
                         else{
                             window.open( "http://"+$(e.target).attr("href"), '临澧OA平台', sFeatures );
                         }
                         return false;

                     }
				 }
				 
			}
	);

    /**
	 * 回复、填充自动完成
	 */
	function fillAutoComplete(username,userid){
		  $("#form-field-recipient_id").val(userid+",");
		  $("input[name='recipient']").attr("value",username+", ");
	}
	
	
	
	function delMail(mailid){
        $.ajax({
            url: "delEmail?random="+parseInt(Math.random()*100000),
            data:{ 
            	mailid:mailid,
            	boxtype:boxtype
            },
            timeout: 30000,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (textStatus == "timeout") { // 请求超时
                    myGritterError("请求超时");
                }
                else{
                    myGritterError("服务器故障："+errorThrown);
                }
            },
            success: function (data, textStatus) {
                if (textStatus == "success") { // 请求成功
                	if(data!=null){
                		queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
                	}
                }
            }
        });
	}


    /**
	 * 获取邮件内容
	 */
	function queryMailContent(e,mailid,mailState){
	       $.ajax({
	            url: "queryMailContent?random"+parseInt(Math.random()*100000),
	            data:{ 
	            	mailid: mailid,
	            	mailState:mailState
	            },
	            timeout: 30000,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                if (textStatus == "timeout") { // 请求超时
                        myGritterError("请求超时");
	                }
	                else{
                        myGritterError("服务器故障："+errorThrown);
	                }
	            },
	            success: function (data, textStatus) {
	                if (textStatus == "success") { // 请求成功
	                	if(data!=null){
	                		
	                		
	        				var message = $(e.target).parent('.message-item');
                            if(message.length==0){
                                message= e.parent('.message-item');
                            }

							// if message is open, then close it
							if (message.hasClass('message-inline-open')) {
								message.removeClass('message-inline-open').find('.message-content').remove();
								return;
							}
							
							$('.message-container')
									.append(
											'<div class="message-loading-overlay"><i class="fa-spin ace-icon fa fa-spinner orange2 bigger-160"></i></div>');
							setTimeout(
									function() {
										$('.message-container').find('.message-loading-overlay').remove();
										message.addClass('message-inline-open').append('<div class="message-content">');
										
										var content = message.find('.message-content:last').html($('#id-message-content').html());

										content.find('.scroll-track').remove();
										content.find('.scroll-content').children().unwrap();
										
										var title = message.find(".summary")[0].innerHTML;
										var sender = message.find(".sender")[0].innerHTML;
										var sendtime = message.find(".time")[0].innerHTML;
										
										$(".message-content").find(".blue.bigger-125").empty().append(title);
										$(".message-content").find(".sender").empty().append(sender);
										$(".message-content").find(".time.grey").empty().append(sendtime);
										
										$(".message-body").empty().html(data.data.mailcontent);
										
										
										content.find('.message-body').ace_scroll({
											size : 350,
											mouseWheelLock : false,
											styleClass : 'scroll-visible'
										});

                                        var attachmentstr = "";
                                        if(data.attachments!=null){
                                            for(var i =0 ; i < data.attachments.length ; i++){
                                                attachmentstr = attachmentstr + "<ul class='attachment-list pull-left list-unstyled'>" +
                                                    "<li>" +
                                                    "   <a href='#' class='attached-file'>" +
                                                            "<i class='ace-icon fa fa-file-o bigger-110'></i>" +
                                                            "<span class='attached-name'>"+data.attachments[i].filename+"</span>" +
                                                    "</a>" +
                                                    "<span class='action-buttons'>" +
                                                        "<a  href='downEmailFile?emailFilePath="+data.attachments[i].filepath+"&emailFileName="+data.attachments[i].filename+"' target='_self'>" +
                                                            "<i class='ace-icon fa fa-download bigger-125 blue'></i>" +
                                                        "</a>" +
                                                    "</span>" +
                                                    "</li></ul>" ;
                                            }
                                        }

                                        $(".message-attachment").empty().html(attachmentstr);

									}, 500 + parseInt(Math.random() * 500));
	                		
	                	}
	                	
	                	
	                	message.removeClass("message-unread").find(".message-star.ace-icon.fa.fa-star.orange2").remove();
	                	$("#id-message-infobar").children("span.grey").text("("+ data.totals+" 封未读)");
	                }
	            }
	        });
	};

    $( "#my_mail_choose_stuff" ).on('click', function(e) {
        e.preventDefault();

        var dialog = $( "#my_tree_modal" ).removeClass('hide').dialog({
            open: function( event, ui ) {
                console.log("event:"+event);
            },
            modal: true,
            title: '选择人员',
            title_html: true,
            minHeight: $(window).width()*0.36,
            minWidth: $(window).width()*0.46,
            buttons: [
                {
                    text: "取消",
                    "class" : "btn btn-xs",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                },
                {
                    text: "确定",
                    "class" : "btn btn-primary btn-xs",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                }
            ]
        });

    });


    $("#check_all_del").click(function() {
        var maildids = delCheckAll();
        $.ajax({
            url: "delAllCheckMails?random" + parseInt(Math.random() * 100000),
            type: "post",
            data: {
                sSearch: maildids,
                boxtype: boxtype
            },
            timeout: 30000,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (textStatus == "timeout") { // 请求超时
                    myGritterError("请求超时");
                }
                else {
                    myGritterError("服务器故障：" + errorThrown);
                }
            },
            success: function (data, textStatus) {
                if (data.msg > -1) {
                    myGritterSuccess("操作成功");
                    queryEmailItemsFunc("message-list",boxtype,startSize,pageSize);
                }
            }
        });
    });

    function delCheckAll(){
        var mailids = "";
        var arr = [] ;
        arr = $(".message-item.selected > .mailid");

        $.each(arr,function(i,item){
            mailids = mailids + $(this).val()+",";
        });

        if(mailids.length>1){
            mailids = mailids.substr(0,mailids.length - 1);
        }
        return mailids;
    }
	
	// back to message list
	$('.btn-back-message-list').on('click', function(e) {

		e.preventDefault();
		$('#inbox-tabs a[href="#inbox"]').tab('show');


        $("#form-field-recipient_id").val("");
        $("input[name='recipient']").attr("value","");
	});

	// hide message list and display new message form
	/**
	 * $('.btn-new-mail').on('click', function(e){ e.preventDefault();
	 * Inbox.show_form(); });
	 */

	var Inbox = {
		// displays a toolbar according to the number of selected messages
		display_bar : function(count) {
			if (count == 0) {
				$('#id-toggle-all').removeAttr('checked');
                $('#id-message-list-navbar .message-toolbar').addClass('hide');
                if(boxtype===2){
                    $('#id-message-list-navbar .message-infobar').removeClass('hide');
                }

			} else {
                $('#id-message-list-navbar .message-infobar').addClass('hide');
				$('#id-message-list-navbar .message-toolbar').removeClass('hide');
			}
		},
		select_all : function() {
			var count = 0;
			$('.message-item input[type=checkbox]').each(function() {
				this.checked = true;
				$(this).closest('.message-item').addClass('selected');
				count++;
			});

			$('#id-toggle-all').get(0).checked = true;
			Inbox.display_bar(count);
            $('#id-message-list-navbar .message-infobar').addClass('hide');
		},
		select_none : function() {
			$('.message-item input[type=checkbox]').removeAttr('checked')
					.closest('.message-item').removeClass('selected');
			$('#id-toggle-all').get(0).checked = false;

			Inbox.display_bar(0);
		},
		select_read : function() {
			$('.message-unread input[type=checkbox]').removeAttr('checked')
					.closest('.message-item').removeClass('selected');

			var count = 0;
			$('.message-item:not(.message-unread) input[type=checkbox]').each(
					function() {
						this.checked = true;
						$(this).closest('.message-item').addClass('selected');
						count++;
					});
			Inbox.display_bar(count);
		},
		select_unread : function() {
			$('.message-item:not(.message-unread) input[type=checkbox]')
					.removeAttr('checked').closest('.message-item')
					.removeClass('selected');

			var count = 0;
			$('.message-unread input[type=checkbox]').each(function() {
				this.checked = true;
				$(this).closest('.message-item').addClass('selected');
				count++;
			});

			Inbox.display_bar(count);
		}
	}

	// show message list (back from writing mail or reading a message)
	Inbox.show_list = function() {
		$('.message-navbar').addClass('hide');
		$('#id-message-list-navbar').removeClass('hide');

		$('.message-footer').addClass('hide');
		$('.message-footer:not(.message-footer-style2)').removeClass('hide');

		$('.message-list').removeClass('hide').next().addClass('hide');
		// hide the message item / new message window and go back to list
	}

	// show write mail form
	Inbox.show_form = function(data) {
		if ($('.message-form').is(':visible'))
			return;
		if (!form_initialized) {
			initialize_form();

            getMembers();
		}

		var message = $('.message-list');
		$('.message-container')
				.append(
						'<div class="message-loading-overlay"><i class="fa-spin ace-icon fa fa-spinner orange2 bigger-160"></i></div>');

		setTimeout(
				function() {
					message.next().addClass('hide');

					$('.message-container').find('.message-loading-overlay')
							.remove();

					$('.message-list').addClass('hide');
					$('.message-footer').addClass('hide');
					$('.message-form').removeClass('hide').insertAfter(
							'.message-list');

					$('.message-navbar').addClass('hide');
					$('#id-message-new-navbar').removeClass('hide');

					// reset form??
					$('.message-form .wysiwyg-editor').empty();
					
					if(data!=null){
						$('.message-form .wysiwyg-editor').html(data);
					}
					$('.message-form').get(0).reset();

				}, 300 + parseInt(Math.random() * 300));
	}

	var form_initialized = false;
	function initialize_form() {
		if (form_initialized)
			return;
		form_initialized = true;
        $('.message-form .wysiwyg-editor').ace_wysiwyg({
            toolbar:
                [
                    'bold',
                    'italic',
                    'strikethrough',
                    'underline',
                    null,
                    'justifyleft',
                    'justifycenter',
                    'justifyright',
                    null,
                    'createLink',
                    'unlink',
                    null,
                    'undo',
                    'redo'
                ],speech_button: false
        }).prev().addClass('wysiwyg-style1');
	}// initialize_form


    var url=window.location.href;
    if(url.indexOf("?")!=-1){
        var flag=url.substr(url.indexOf("=")+1,5);
        if(flag!='mail'){
            newMail($('#inbox-tabs a[data-toggle="tab"]'),flag);
        }
    }



    $("#menutree li.hsub a span").each(function(i,item){

        var flag=url.substr(url.indexOf("=")+1,5);

        if(item.innerHTML.indexOf("内部邮箱") > 0){
            $(item).parent().parent().addClass("open");
            $(item).parent().parent().children("ul .submenu").addClass("nav-show").attr("style","display: block;");

            $(item).parent().parent().children("ul .submenu").find("a").each(function(n,iter){
                   if(iter.href.substr(url.indexOf("=")+1,5) === flag){
                       $(iter).parent().addClass("active");
                   }
            });
        }
    });

});