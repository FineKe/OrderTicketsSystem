<%--
  Created by IntelliJ IDEA.
  User: finefine.com
  Date: 2017/12/24
  Time: 下午12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>路线管理</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="../../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.css" rel="stylesheet">
    <link href="../../static/css/style.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="../../static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link href="../../static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../../static/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInUp">
    <div class="row">
        <div class="col-sm-12">

            <div class="ibox">
                <div class="ibox-title">
                    <h5>所有路线</h5>
                    <div class="ibox-tools">
                        <a href="" class="btn btn-primary btn-xs">创建新路线</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row m-b-sm m-t-sm">
                        <div class="col-md-1">
                            <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i
                                    class="fa fa-refresh"></i> 刷新
                            </button>
                        </div>
                        <div class="col-md-11">
                            <div class="input-group">
                                <input type="text" placeholder="请输入车次" class="input-sm form-control"> <span
                                    class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>
                    </div>

                    <div class="project-list">
                        <table class="table table-hover" id="table">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title">窗口标题</h4>
                <small class="font-bold"></small>
            </div>
            <div class="modal-body">
                <p><strong>H+</strong> 是一个完全响应式，基于Bootstrap3.3.6最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.1)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA等等，当然，您也可以对她进行深度定制，以做出更强系统。</p>
                <div class="form-group"><label>Email</label> <input type="email" placeholder="请输入您的Email" class="form-control"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

</div>

<!-- 全局js -->
<script src="../../static/js/jquery.min.js?v=2.1.4"></script>
<script src="../../static/js/bootstrap.min.js?v=3.3.6"></script>


<!-- 自定义js -->
<script src="../../static/js/content.js?v=1.0.0"></script>


<script>
    $(document).ready(function () {

        $('#loading-example-btn').click(function () {
            btn = $(this);
            simpleLoad(btn, true)

            // Ajax example
//                $.ajax().always(function () {
//                    simpleLoad($(this), false)
//                });

            simpleLoad(btn, false)
        });
    });

    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass('fa-spin');
            btn.contents().last().replaceWith(" Loading");
        } else {
            setTimeout(function () {
                btn.children().removeClass('fa-spin');
                btn.contents().last().replaceWith(" Refresh");
            }, 2000);
        }
    }
</script>
<script src="../../static/js/content.js?v=1.0.0"></script>
<script src="../../static/js/plugins/sweetalert/sweetalert.min.js"/>
<script src="../../static/js/jquery.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="../../static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">

    $(function () {
        //初始化Table
        var oTable = new TableInit();
        oTable.Init();
    })

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#table').bootstrapTable({
                url: '/tickets/lines',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
//               toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                iconsPrefix: '',
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                width: 800,
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图

                detailView: false,                  //是否显示父子表
                columns: [
                    {
                        title: '车次',
                        field: 'trainNumber',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        title: '创建时间',
                        field: 'createTime',
                        align: 'center',
                        valign: 'middle'
                    }
                    ,
                    {
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter
                    }
                ]
            });
        };

        function operateFormatter(value, row, index) {
            return [
                '<button type="button" class="btn_delete btn btn-warning  btn-sm " style="margin-right:15px;">删除</button>',
                '<button type="button" class="btn_alter btn btn-success  btn-sm" style="margin-right:15px;">修改</button>',
                '<button type="button" class="btn_detail btn btn-info  btn-sm" style="margin-right:15px;">查看</button>',
            ].join('');
        };


        window.operateEvents={
            'click .btn_delete': function (e, value, row, index) {
                    swal({
                        title: "您确定要删除这条路线",
                        text: "删除后将无法恢复，请谨慎操作！",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "删除",
                        closeOnConfirm: false
                    }, function () {

                        swal("删除成功！", "您已经永久删除了这条线路。", "success");
                    });
            },'click .btn_alter': function (e, value, row, index) {
                    $('#myModal').show(e);

            },'click .btn_detail': function (e, value, row, index) {

            }
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset,  //页码
            };
            return temp;
        };

        return oTableInit;
    }
</script>
</body>
</html>
