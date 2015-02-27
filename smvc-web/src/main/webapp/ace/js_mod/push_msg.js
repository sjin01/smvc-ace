jQuery(function($) {


    var tangDoc = this;

    function getRootPath(){
        var strFullPath=this.document.location.href;
        var strPath=this.document.location.pathname;
        var pos=strFullPath.indexOf(strPath);
        var prePath=strFullPath.substring(0,pos);
        var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
        return(prePath+postPath);
    }


    function tang_flash_title()
    {
        //当窗口效果为最小化，或者没焦点状态下才闪动
        if(tangIsCurrentMinStatus() || !tangDoc.focus)
        {
            tangNewCurrentMsgCount();
            tangNewCurrentNotCount();
        }
        else
        {
            $(document).attr("title", "临澧县教育OA平台");
        }
    }
//消息提示
    var flag=false;
    function tangNewCurrentMsgCount(){
        if(flag){
            flag=false;
            $(document).attr("title", "【新邮件】 临澧县教育OA平台");
        }else{
            flag=true;
            $(document).attr("title", "临澧县教育OA平台");
        }
    }

    //通知
    var flagNot=false;
    function tangNewCurrentNotCount(){
        if(flagNot){
            flagNot=false;
            $(document).attr("title", "【新通知】 临澧县教育OA平台");
        }else{
            flagNot=true;
            $(document).attr("title", "临澧县教育OA平台");
        }
    }
//判断窗口是否最小化
//在Opera中还不能显示
    var myIsCurrentMin = false;
    function tangIsCurrentMinStatus() {
        //除了Internet Explorer浏览器，其他主流浏览器均支持Window outerHeight 和outerWidth 属性
        if(this.outerWidth != undefined && this.outerHeight != undefined){
            myIsCurrentMin = tangDoc.outerWidth <= 160 && tangDoc.outerHeight <= 27;
        }else{
            myIsCurrentMin = tangDoc.outerWidth <= 160 && tangDoc.outerHeight <= 27;
        }
        //除了Internet Explorer浏览器，其他主流浏览器均支持Window screenY 和screenX 属性
        if(this.screenY != undefined && this.screenX != undefined ){
            myIsCurrentMin = tangDoc.screenY < -30000 && tangDoc.screenX < -30000;//FF Chrome
        }else{
            myIsCurrentMin = tangDoc.screenTop < -30000 && tangDoc.screenLeft < -30000;//IE
        }
        return myIsCurrentMin;
    }


    var usercode = $("#push_userid").text();
    if(usercode){
        var socket = io.connect();
        if(socket){
            socket.emit("eduz_100_online",usercode);
        }
        /**
         * 监听新消息
         */
        socket.on("eduz_100_push_"+usercode,function(data){
            if(data){
                if(data.mailDetailList){
                    var rootPath = getRootPath();
                    $("#oa_mail_push_count > span").text(data.mailDetailList.length);

                    var tbody =
                        "<li class='dropdown-header'>" +
                        "<i class='ace-icon fa fa-envelope-o'></i>"+ data.mailDetailList.length+"封未读邮件</li>" +
                        " <li class='dropdown-content'>" +
                        " <ul class='dropdown-menu dropdown-navbar'>";
                    $.each(data.mailDetailList,function(n,value) {

                        var trs = "";
                        trs += "<li><a href='"+rootPath+"/oa/email/inbox?flag=inbox&mailid="+value.mailid+"'>" +
                            "<span class='msg-body'>" +
                            "<span class='msg-title'><span class='blue'>邮件标题：</span>" +value.mailtitle+"" +
                            "</span>" +
                            "</a></li>";
                        tbody += trs;
                    });
                    tbody = tbody + "</ul></li><li class='dropdown-footer'><a href= '"+rootPath+"/oa/email/inbox.html?flag=inbox'> 查看所有邮件" +
                        "<i class='ace-icon fa fa-arrow-right'></i></a></li>";

                    $("#oa_mail_push_detail").empty().append(tbody);
                    tang_flash_title();
                }
                if(data.notificationList&&data.notificationList.length>0){
                    var str="";
                    var len=data.notificationList.length;
                    $("#showUnRead").html(len);
                    $("#unread_ul").empty()
                    //$("#unread_ul").append("<li class='dropdown-header'><i class='ace-icon fa fa-exclamation-triangle'></i>"+len+"条未读通知</li>");
                    $("#unread_ul").append("<li class='dropdown-header'><i class='ace-icon fa fa-bell'></i>"+len+"条未读通知</li>");

                    var flag=1;
                    for(var a=len-1;a>=0;a--){
                        if(flag>3) break;
                        var notitle=data.notificationList[a].title;
                        if(null!=notitle&& $.trim(notitle)!=''){
                            if(notitle.length>10)
                                notitle=notitle.substring(0,10)+"..."
                        }
                        str+="<li><a href='#' onclick='oneNoti("+data.notificationList[a].noticeSeq+");'>通知标题:"
                            +notitle+"</a></li>";
                        flag+=1;
                    }


                    $("#unread_ul").append(str);

                    var hrefs=getRootPath()+"/oa/notification/display";
                    var unread_ul_str="<li class='dropdown-footer'>"+
                        "<a href='"+hrefs+"'> 查看所有通知 <i class='ace-icon fa fa-arrow-right'></i></a>"+
                        "</li>";
                    $("#unread_ul").append(unread_ul_str);

                }else{
                    $("#unread_ul").empty();
                    $("#unread_ul").append("<li class='dropdown-header'><i class='ace-icon fa fa-exclamation-triangle'></i>您暂时没有新的通知</li>");

                    var hrefs=getRootPath()+"/oa/notification/display";
                    var unread_ul_str="<li class='dropdown-footer'>"+
                        "<a href='"+hrefs+"'> 查看所有通知 <i class='ace-icon fa fa-arrow-right'></i></a>"+
                        "</li>";
                    $("#unread_ul").append(unread_ul_str);
                }

                if(data.messageList){
                    $("#oa_message_push_count > span").text(data.messageList.length);
                    var num = data.messageList.length;
                    var tbody = "";
                    if (num == 0){
                    	tbody += "<li class='dropdown-header'><i class='ace-icon fa fa-exclamation-triangle'></i>您暂时没有新的消息</li>";
                    }else{
                    	tbody =
                    		"<li class='dropdown-header'>" +
                    		"<i class='ace-icon fa fa-envelope-o'></i>"+ data.messageList.length+"人的消息未查看</li>" +
                    		" <li class='dropdown-content'>" +
                    		" <ul class='dropdown-menu dropdown-navbar'>";
                    }
                    $.each(data.messageList,function(n,value) {
                        var trs = "";
                        trs += "<li><a href='#' onclick='onPushMessage("+value.addresser+",\""+ value.name+"\" ,\""+value.img+"\")'>" +
                            "<span class='msg-body'>" +
                            "<span class='msg-title'><span class='blue'>"+value.name+"：</span>共有" +value.number+"条未查看消息" +
                            "</span>" +
                            "</a></li>";
                        tbody += trs;
                    });
                    $("#oa_message_push_detail").empty().append(tbody);
                }
            }
        });
    }
});