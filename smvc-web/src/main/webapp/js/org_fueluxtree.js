/**
 * Title :盛通-- 临澧教育局平台
 * Description:  ORG 组织机构树 ，
 * 创建日期: 12/24  17:07
 * @author: sjin QQ: 928990049
 */



// 定义 Tree 如何根据 pid 查询数据  ,在下面 initOrgTree 中初始化， 但其中data方法 实际是在 ace_tree 中调的
function DataSourceTree(options) {

    this.url = options.url;
    this.deliverid = options.deliverid;
    this.delivertype = options.delivertype;

    this.data = function(options, callback) {
//                console.log(options);
        var parent_id = null
        if( !('name' in options || 'type' in options) ){
            parent_id = 0;// 第一次加载
        }
        else if('type' in options && options['type'] == 'folder') {// 有子节点
            if('children' in options) parent_id = options.id;
        }

        if(parent_id !== null) {
            $.ajax({
                url: this.url,
                data: { 'pid':parent_id ,'deliverid': this.deliverid, 'delivertype':this.delivertype },
                type: 'POST',
                dataType: 'json',
                success : function(response) {
                    //console.log(response);
                    if(response.code == 200)
                        callback({ data: response.data })
                },
                error: function(response) {
                    //console.log(response);
                }
            })
        }
    }
};

/**
 *
 * @param elementId  初始化 树结构的 element id属性
 * @param url 对应后台查询 数据的接口
 * @param multiSelect  是否可以多选
 * @param fn_nodeClick 点击任何一个节点的事件方法
 * @returns {*|jQuery}
 */
function initOrgTree ( elementId , url , multiSelect , fn_nodeClick ,deliverid ,delivertype ){
    $( '#'+ elementId ).ace_tree({
        dataSource: new DataSourceTree({url: url ,deliverid:deliverid ,delivertype:delivertype }) ,
        multiSelect: multiSelect,
        loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
        'open-icon' : 'tree-minus',
        'close-icon' : 'tree-plus',
        'selectable' : true,
        'selected-icon' : 'fa fa-check',
        'unselected-icon' : 'fa fa-check',
        'nodeClick' : fn_nodeClick
    });

    var tree = $('#' + elementId).data('tree');
    return tree;
}