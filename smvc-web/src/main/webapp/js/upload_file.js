/**
 * Title :盛通-- 临澧教育局平台
 * Description:
 * 创建日期: 1/22  11:06
 * @author: sjin QQ: 928990049
 */


/**
 * 上传文件 工具
 *
 * 使用示例：初始化
 * form = $("#tab_sealmanager_form");
   file_input = form.find('input[type=file]').eq(0);
   var uploadtool = new UploadTool({
        uploadPath:'$!{uploadPath}',
        progressPath:'$!{uploadProgressPath}',
        fileInput:file_input,
        form:form,
        progressDivId:'progress_div'
    }, callback );

   调用上传： uploadtool.upload();
 *
 * @param options
 * @param options uploadPath   --- 上传路径
 * @param options progressPath   --- 进度条访问路径
 * @param options file_input --- 文件选择框 element
 * @param options form --- 表单 JQuery 对象
 * @param options progressDivId --- 进度条 div 的ID
 * @returns {{upload: uploadFile}}
 *
 * @constructor
 */
var UploadTool = function (options ,callbackFn) {
    var _upload_path = options.uploadPath;
    var pro_url = options.progressPath + '?X-Progress-ID=';
    var file_input = options.fileInput;
    var form = options.form;
    var progress_div_id = options.progressDivId;
    var _refreshspeed = options.refreshSpeed; if(!_refreshspeed){_refreshspeed = 1000}

    var uuid ='', interval, files = null;
    var upload_in_progress = false;
    var ie_timeout;

    var resultData ;

    function uploadFile() {
        for (var i = 0; i < 32; i++) {
            uuid += Math.floor(Math.random() * 16).toString(16);
        }

        files = file_input.data('ace_input_files');
        if (!files || files.length == 0){
            callbackFn(resultData);
            return false;//如果没有选择文件
        }

        var deferred;
        var action = _upload_path + '?X-Progress-ID=' + uuid;
        if ("FormData" in window) {
            var formData_object = new FormData();//创建空的 FormData 对象

            $.each(form.serializeArray(), function (i, item) {
                formData_object.append(item.name, item.value);
            });
            form.find('input[type=file]').each(function () {
                var field_name = $(this).attr('name');

                files = $(this).data('ace_input_files');
                if (files && files.length > 0) {
                    for (var f = 0; f < files.length; f++) {
                        formData_object.append(field_name, files[f]);
                    }
                }
            });

            upload_in_progress = true;
            //file_input.ace_file_input('loading', true);

            deferred = $.ajax({
                url: action,
                type: 'POST',
                processData: false,//important
                contentType: false,//important
                dataType: 'json',
                data: formData_object
                /**
                 ,
                 xhr: function() {
								var req = $.ajaxSettings.xhr();
								if (req && req.upload) {
									req.upload.addEventListener('progress', function(e) {
										if(e.lengthComputable) {
											var done = e.loaded || e.position, total = e.total || e.totalSize;
											var percent = parseInt((done/total)*100) + '%';
											//percentage of uploaded file
										}
									}, false);
								}
								return req;
							},
                 beforeSend : function() {
							},
                 success : function(date) {
                        console.log(date);
                    }*/
            })

        }
        else {
            deferred = new $.Deferred

            var temporary_iframe_id = 'temporary-iframe-' + (new Date()).getTime() + '-' + (parseInt(Math.random() * 1000));
            var temp_iframe =
                $('<iframe id="' + temporary_iframe_id + '" name="' + temporary_iframe_id + '" \
								frameborder="0" width="0" height="0" src="about:blank"\
								style="position:absolute; z-index:-1; visibility: hidden;"></iframe>')
                    .insertAfter(form)

            form.append('<input type="hidden" name="temporary-iframe-id" value="' + temporary_iframe_id + '" />');

            temp_iframe.data('deferrer', deferred);
            form.attr({
                method: 'POST',
                enctype: 'multipart/form-data',
                target: temporary_iframe_id //important
            });

            upload_in_progress = true;
            //file_input.ace_file_input('loading', true);//display an overlay with loading icon
            form.attr('action', action);
            form.get(0).submit();

            ie_timeout = setTimeout(function () {
                ie_timeout = null;
                temp_iframe.attr('src', 'about:blank').remove();
                deferred.reject({'status': 'fail', 'message': 'Timeout!'});
            }, 30000);
        }


        ////////////////////////////
        //deferred callbacks, triggered by both ajax and iframe solution
        deferred
            .done(function (result) {//success
                /*console.log(files[0].name);
                 console.log(result.file_size);
                 console.log(result.file_url);*/
                /*$("#upload_file_filename").val(files[0].name);
                $("#upload_file_filepath").val(result.file_url);
                $("#upload_file_filesize").val(result.file_size);*/
                resultData = {
                    filename : files[0].name ,
                    filepath : result.file_url,
                    filesize : result.file_size
                }
            })
            .fail(function (result) {//failure
                alert("系统繁忙，请稍后再试！");
            })
            .always(function () {//called on both success and failure
                if (ie_timeout) clearTimeout(ie_timeout)
                ie_timeout = null;
                upload_in_progress = false;
                //file_input.ace_file_input('loading', false);
            });

        deferred.promise();

        $("#"+progress_div_id).show();
        // $("#dept_plan_file_btn").hide();
        interval = window.setInterval(
            function () {
                getUploadProgress(uuid);
            },
            _refreshspeed
        )
    }

    //获取文件上传进度
    function getUploadProgress(uuid) {

        $.getJSON(pro_url + uuid, function (data) {

            if (data.state == "done") {
                //上传完成
                $("#"+progress_div_id).children().css({width: "100%"});
                $("#"+progress_div_id).attr('data-percent', '完成');
                window.clearTimeout(interval);

                callbackFn(resultData);
            } else {
                //实时显示上传进度
                var w = Math.floor(data.received * 100.0 / data.size);
                $("#"+progress_div_id).children().css({width: w + '%'});
                $("#"+progress_div_id).attr('data-percent', w + '%');
            }

        });
    }

    return {
        upload :uploadFile
    }
}




