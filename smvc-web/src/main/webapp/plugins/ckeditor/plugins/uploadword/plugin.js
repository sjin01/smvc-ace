(function() {
	// Section 1 : 按下自定义按钮时执行的代码
	var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var bashPath = localhostPaht + projectName;
    
	var a = {
		exec : function(editor) {
            console.info("STEP1:Open File Chance .....");
			var idx = new Date().getTime() + '';
			if ($("#wordfile_" + idx).length == 0) {
				$('body').append(
						'<input type="file" style="display:none;" name="wordfile" id="wordfile_'
								+ idx + '" >');
			}
			$("#wordfile_" + idx).click();
			$("#wordfile_" + idx).live('change', function() {
                console.info("STEP2:监控到用户选择了文件 .....");
				var path = $("#wordfile_" + idx).val();
				var Ary = path.split('.');
				var filetype = Ary[Ary.length - 1];
				if (!(filetype == "doc" || filetype == "docx")) {
					$("#wordfile_" + idx).remove();
					alert('请选择Word文件');
					return false;
				}

                var title = '操作提示';
                var content="正在上传解析";
                $('<div id="myModal' + idx + '" class="modal hide fade" data-backdrop="false">' +
                    '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>' +
                    '<h3 id="myModalLabel">' + title + '</h3>' +
                    '</div>' +
                    '<div class="modal-body">' + content + '</div>' +
                    '</div>').appendTo($('body', document));
                $('#myModal' + idx).on('show', function () {
                    $('body', document).addClass('modal-open');
                    $('<div class="modal-backdrop fade in"></div>').appendTo($('body', document));
                });
                $('#myModal' + idx).on('hide', function (e) {
                    $('body', document).removeClass('modal-open');
                    $('div.modal-backdrop').remove();
                    $('#myModal' + idx).remove();
                });
                $("#myModal"+idx)
                    .ajaxStart(function(){
                        console.info("STEP3:开始上传服务器解析Word文档 .....");
                        $(this).modal('show');
                    })//开始上传文件时显示一个图片
                    .ajaxComplete(function(){
                        console.info("STEP5:END.....");
                        $(this).modal('hide');
                    });//文件上传完成将图片隐藏起来



				$.ajaxFileUpload({
					url : bashPath+"/upload/uploadword",
					secureuri : false,
					fileElementId : 'wordfile_' + idx,
					dataType : 'TEXT',
					success : function(data, status) {
//						editor.insertHtml("<pre class=\"brush:html;\">" + data + "</pre>");
                        console.info("STEP4:将解析的Word的Html在富文本编辑器CKeditor中渲染.....");
                        editor.insertHtml(data);
					},
					error : function(data, status, e) {
						alert(e);
					}
				});
			});
		}
	},
	// Section 2 : 创建自定义按钮、绑定方法
	b = 'uploadword';
	CKEDITOR.plugins.add(b, {
		init : function(editor) {
			editor.addCommand(b, a);
			editor.ui.addButton('uploadword', {
				label : '上传WORD文档',
				icon : this.path + 'icons/uploadWord.jpg',
				command : b
			});
		}
	});
})();
