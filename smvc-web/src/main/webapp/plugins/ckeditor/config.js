/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	 config.uiColor = '#D1DFF2!important';
	 // 界面语言，默认为 'en'
    config.language = 'zh-cn';
    //config.width = 700; //宽度
    config.width = '100%';
    config.height = 600; //高度
    config.toolbar = 'Full';
    config.toolbar_Full = [
        ['Source','-',/*'Save','NewPage',*/'Preview'/*,'-','Templates'*/],
        /*['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],*/
        /*['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],*/
        /*['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],*/
        ['Image','Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        /*['Link','Unlink','Anchor'],*/
        /*'/',*/
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        [/*'Image','Flash',*/'Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
        ['TextColor','BGColor','-','uploadword'/*,'addpic'*/],
        ['Styles','Format','Font','FontSize']

    ];
    config.font_names = 'Comic Sans Ms;Courier New;Goergia;Lucida Sans Unicode;Tahoma;Times New Roman;Trebuchet MS;Verdana;楷体;新宋体;仿宋;幼圆;华文宋体;隶书;华文细黑;华文楷体;华文仿宋;方正舒体;方正姚体;华文彩云'; 
    /*
    config.toolbar_Full = [
        ['Source','-','Preview','-','Maximize','-','uploadword']
    ];*/

    //工具栏是否可以被收缩
    //config.toolbarCanCollapse = true;

    //注册插件
    config.extraPlugins += (config.extraPlugins ? ',uploadword,' : 'uploadword,htmlwriter');
    config.image_previewText=' '; //预览区域显示内容
    //上传图片的地址
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var bashPath = localhostPaht + projectName;
    config.filebrowserUploadUrl=bashPath+"/upload/uploadimg";
};
