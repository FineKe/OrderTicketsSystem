<%--
  Created by IntelliJ IDEA.
  User: finefine.com
  Date: 2017/12/15
  Time: 上午2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火车票查询</title>
    <meta charset="UTF-8"/>

    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <style>
        label {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container" style="margin-top: 10px;">
    <div class="row">
        <div class="col-sm-3" style="text-align: center">
            <label class="col-sm-4 control-label" for="starting">出发地</label>
            <div class="col-sm-8">
                <input type="text" id="starting" class="form-control layer-date" name="starting">

            </div>
        </div>

        <div class="col-sm-3">
            <label class="col-sm-4 control-label" for="destination">目的地</label>
            <div class="col-sm-8">
                <input type="text" id="destination" class="form-control layer-date" name="destination">
            </div>
        </div>
        <div class="col-sm-3">
            <label class="col-sm-4 control-label" for="date_picker">出发日</label>
            <div class="col-sm-8">
                <input type="text" id="date_picker" class="laydate-icon form-control layer-date" name="date">
            </div>
        </div>

        <div class="col-sm-3">
            <div class="col-sm-4">
                <button type="button" id="search" class="search form-control  layer-date btn-info" onclick="search()"> <span class="glyphicon glyphicon-search"></span></button>
            </div>
        </div>
    </div>
    <div class="row">
        <table id="table"></table>
    </div>
</div>
<script src="../../static/js/plugins/layer/laydate/laydate.js"></script>
<script src="../../static/js/jquery.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="../../static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script>
    //外部js调用
    laydate({
        elem: '#date_picker', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY/MM/DD hh:mm:ss',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16 23:59:59', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end',
        format: 'YYYY/MM/DD hh:mm:ss',
        min: laydate.now(),
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
</script>

<script>
    function search(){
        var param={url:'/tickets/search',
            query:{
                starting: $('#starting').val(),
                destination: $('#destination').val(),
                startingDate: $('#date_picker').val()}
        }

        $("#table").bootstrapTable('refresh',param);
    };
</script>

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
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                width:1400,
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图

                detailView: false,                  //是否显示父子表
                columns: [
                    {
                        title: '车次',
                        field: 'trainNumber'
                    }, {
                        title: '出发站:到达站',
                        field: 'stations'
                    }, {
                        title: '出发时间:到达时间',
                        field: 'stationTime'
                    }, {
                        title: '历时',
                        field: 'arrivadeTime'
                    }, {
                        title: '商务座',
                        field: 'businessClassTickets'
                    }, {
                        title: '一等座',
                        field: 'firstClassTickets'
                    }, {
                        title: '二等座',
                        field: 'sencondClassTickets'
                    }, {
                        title: '高级软卧',
                        field: 'seniorSoftSleeperTickets'
                    }, {
                        title: '软卧',
                        field: 'softSleeperTickets'
                    }, {
                        title: '动卧',
                        field: 'activelyingPosmonTickets'
                    }, {
                        title: '硬卧',
                        field: 'touristCoachTickets'
                    }, {
                        title: '软座',
                        field: 'softSeatTickets'
                    }, {
                        title: '硬座',
                        field: 'hardTickets'
                    },
                    {
                        field: 'noSeatTickets',
                        title: '无座'
                    }
                ]
            });
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
