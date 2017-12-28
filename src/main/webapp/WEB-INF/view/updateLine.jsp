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
                        <a class="btn btn-primary btn-xs" onclick="createline()">创建新路线</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row m-b-sm m-t-sm">
                        <div class="col-md-1">
                            <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" onclick="refreshTable()"><i
                                    class="fa fa-refresh"></i> 刷新
                            </button>
                            <a href="">页面刷新</a>
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
                <i class="fa fa-train modal-icon"></i>
                <h4 class="modal-title">路线修改</h4>
                <small class="font-bold"></small>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="alter_line_form">
                    <div class="form-group" style="display: none" >
                        <label class="col-sm-2 control-label">创建时间</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_createTime"  class="form-control" name="createTime"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                    <div class="form-group" style="display: none">
                            <input type="text"id="alter_id" class="form-control" name="id">
                    </div><div class="hr-line-dashed"></div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车次编辑</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_trainNumber" class="form-control" name="trainNumber"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点编辑</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_stations" class="form-control" name="stations"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点到达时间</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_stationTime" class="form-control" name="stationTime"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出发日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_date_start" class="laydate-icon form-control layer-date" name="statrtingDate"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商务座</label>
                        <div class="col-sm-10">
                            <input type="number"  id="alter_businessClassTickets" class="form-control" name="businessClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">一等座</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_firstClassTickets" class="form-control" name="firstClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二等座</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_sencondClassTickets" class="form-control" name="sencondClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">高级软卧</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_seniorSoftSleeperTickets" class="form-control" name="seniorSoftSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软卧</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_softSleeperTickets" class="form-control" name="softSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">动卧</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_activelyingPosmonTickets" class="form-control" name="activelyingPosmonTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬卧</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_touristCoachTickets" class="form-control" name="touristCoachTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软座</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_softSeatTickets" class="form-control" name="softSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬座</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_hardTickets" class="form-control" name="hardTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">无座</label>
                        <div class="col-sm-10">
                            <input type="number" id="alter_noSeatTickets" class="form-control" name="noSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">票价编辑</label>
                        <div class="col-sm-10">
                            <input type="text" id="alter_ticketsPrice" class="form-control" name="ticketsPrice"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="btn_alter_close" type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="alter_submit()">修改</button>
            </div>
        </div>
    </div>
</div>


<div class="modal inmodal" id="line_create" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title">创建新路线</h4>
                <small class="font-bold"></small>
            </div>
            <div class="modal-body">
                <form id="create_line_form">
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车次编辑</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_trainNumber" class="form-control" name="trainNumber"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点编辑</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_stations" class="form-control" name="stations"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点到达时间</label>
                        <div class="col-sm-10">
                            <input type="text"  id="create_stationTime" class="form-control" name="stationTime" > <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出发日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_date_start" class="laydate-icon form-control layer-date" name="statrtingDate"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商务座</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_businessClassTickets" class="form-control" name="businessClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">一等座</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_firstClassTickets" class="form-control" name="firstClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二等座</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_sencondClassTickets" class="form-control" name="sencondClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">高级软卧</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_seniorSoftSleeperTickets" class="form-control" name="seniorSoftSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软卧</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_softSleeperTickets" class="form-control" name="softSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">动卧</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_activelyingPosmonTickets" class="form-control" name="activelyingPosmonTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬卧</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_touristCoachTickets" class="form-control" name="touristCoachTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软座</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_softSeatTickets" class="form-control" name="softSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬座</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_hardTickets" class="form-control" name="hardTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">无座</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_noSeatTickets" class="form-control" name="noSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">票价编辑</label>
                        <div class="col-sm-10">
                            <input type="text" id="create_ticketsPrice" class="form-control" name="ticketsPrice"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="create_submit()">创建</button>
            </div>
        </div>
    </div>
</div>

</div>


<!-- 全局js -->
<script src="../../static/js/jquery.min.js?v=2.1.4"></script>
<script src="../../static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="../../static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="../../static/js/plugins/validate/messages_zh.min.js"></script>


<!-- 自定义js -->
<script src="../../static/js/content.js?v=1.0.0"></script>
<script src="../../static/js/plugins/layer/laydate/laydate.js"></script>
<script src="../../static/js/content.js?v=1.0.0"></script>
<script src="../../static/js/plugins/sweetalert/sweetalert.min.js"/>
<script src="../../static/js/jquery.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>
<script src="../../static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="../../static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>



<script>
    //外部js调用
    laydate({
        elem: '#alter_date_start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });

    laydate({
        elem: '#create_date_start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus'})

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



<script type="text/javascript">


    function createline() {
        $('#line_create').modal({backdrop: 'static', keyboard: true});
        $('#line_create').show();
    };

    function  createsave() {
        swal({
            title: "您确定要创建这条路线",
            text: "请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Create",
            closeOnConfirm: false
        }, function () {
            var trainNumber=$("#create_trainNumber").val();
            var stations=$("#create_stations").val();
            var stationTime=$("#create_stationTime").val();
            var statrtingDate=$('#create_date_start').val();
            var businessClassTickets=$("#create_businessClassTickets").val();
            var firstClassTickets=$("#create_firstClassTickets").val();
            var sencondClassTickets=$("#create_sencondClassTickets").val();
            var seniorSoftSleeperTickets=$("#create_seniorSoftSleeperTickets").val();
            var softSleeperTickets=$("#create_softSleeperTickets").val();
            var activelyingPosmonTickets=$("#create_activelyingPosmonTickets").val();
            var touristCoachTickets=$("#create_touristCoachTickets").val();
            var softSeatTickets=$("#create_softSeatTickets").val();
            var hardTickets=$("#create_hardTickets").val();
            var noSeatTickets=$("#create_noSeatTickets").val();
            var ticketsPrice=$("#create_ticketsPrice").val();
            var data={'trainNumber':trainNumber,'stations':stations,'stationTime':stationTime,'statrtingDate':statrtingDate
                ,'businessClassTickets':businessClassTickets,'firstClassTickets':firstClassTickets,'sencondClassTickets':sencondClassTickets,'seniorSoftSleeperTickets':seniorSoftSleeperTickets
                ,'softSleeperTickets':softSleeperTickets,'activelyingPosmonTickets':activelyingPosmonTickets,'touristCoachTickets':touristCoachTickets,'softSeatTickets':softSeatTickets,
                'hardTickets':hardTickets,'noSeatTickets':noSeatTickets,'ticketsPrice':ticketsPrice};
            console.info(statrtingDate);
            $.ajax({
                contentType:'application/json;charset=UTF-8',
                url:'/tickets/create',
                type:'post',
                data:JSON.stringify(data),
                dataType:"json",
                success:function(result){
                    var code=result.code;
                    var message=result.message;
                    if (code==0) {
                        swal("创建成功！", "", "success");
                        refreshTable();
                    }else {
                        swal("创建失败失败",message,"error");
                    }
                }

            });
        });
    };

    function altersave() {
        swal({
            title: "您确定要修改这条路线",
            text: "请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "更新",
            closeOnConfirm: false
        }, function () {
            var id=$('#alter_id').val();
            var trainNumber=$('#alter_trainNumber').val();
            var stations=$('#alter_stations').val();
            var stationTime=$('#alter_stationTime').val();
            var statrtingDate=$('#alter_date_start').val();
            var businessClassTickets=$('#alter_businessClassTickets').val();
            var firstClassTickets=$('#alter_firstClassTickets').val();
            var sencondClassTickets=$('#alter_sencondClassTickets').val();
            var seniorSoftSleeperTickets=$('#alter_seniorSoftSleeperTickets').val();
            var softSleeperTickets=$('#alter_softSleeperTickets').val();
            var activelyingPosmonTickets=$('#alter_activelyingPosmonTickets').val();
            var touristCoachTickets=$('#alter_touristCoachTickets').val();
            var softSeatTickets=$('#alter_softSeatTickets').val();
            var hardTickets=$('#alter_hardTickets').val();
            var noSeatTickets=$('#alter_noSeatTickets').val();
            var ticketsPrice=$('#alter_ticketsPrice').val();
            var createTime=$('#alter_createTime').val();
            var data={'id':id,'trainNumber':trainNumber,'stations':stations,'stationTime':stationTime,'statrtingDate':statrtingDate
            ,'businessClassTickets':businessClassTickets,'firstClassTickets':firstClassTickets,'sencondClassTickets':sencondClassTickets,'seniorSoftSleeperTickets':seniorSoftSleeperTickets
            ,'softSleeperTickets':softSleeperTickets,'activelyingPosmonTickets':activelyingPosmonTickets,'touristCoachTickets':touristCoachTickets,'softSeatTickets':softSeatTickets,
            'hardTickets':hardTickets,'noSeatTickets':noSeatTickets,'ticketsPrice':ticketsPrice,'createTime':createTime};
            console.info(data);
            console.info(JSON.stringify(data));
            $.ajax({
                contentType:'application/json;charset=UTF-8',
                url:'/tickets/update',
                type:'post',
                data:JSON.stringify(data),
                dataType:"json",
                success:function(result){
                    var code=result.code;
                    var message=result.message;
                    if (code==0) {
                        swal("更新成功！", "", "success");
                        refreshTable();
                    }else {
                        swal("更新失败",message,"error");
                    }
                }

            });
        });
    }

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
                        valign: 'middle',
                        formatter:function (value, row, index) {
                            if (value==null) {
                                return "";
                            }
                            var date = new Date(value);
                            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                            return date.getFullYear() + "-" + month + "-" + currentDate+" "+date.getHours()+":"+date.getMinutes();
                        }
                    }
                    ,
                    {
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                        events: operateEvents,
                        formatter: operateFormatter,

                    },
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
                        $.ajax({
                            url:'/tickets/delete',
                            type:'post',
                            data:{'id':row.id},
                            dataType:"json",
                            success:function(result){
                                var code=result.code;
                                var message=result.message;
                                    if (code==0) {
                                    swal("删除成功！", "您已经永久删除了这条线路。", "success");
                                        $('#line_detail').modal('hide');
                                    refreshTable();
                                }else {
                                    swal("删除失败",message,"error");
                                }
                            }

                        });
                    });
            },'click .btn_alter': function (e, value, row, index) {
                console.info(row);
                $('#myModal').modal({backdrop: 'static', keyboard: true});
                $('#myModal').show();
                $('#alter_id').val(row.id);
                $('#alter_trainNumber').val(row.trainNumber);
                $('#alter_stations').val(row.stations);
                $('#alter_stationTime').val(row.stationTime);
                $('#alter_statrtingDate').val(row.statrtingDate);
                $('#alter_businessClassTickets').val(row.businessClassTickets);
                $('#alter_firstClassTickets').val(row.firstClassTickets);
                $('#alter_sencondClassTickets').val(row.sencondClassTickets);
                $('#alter_seniorSoftSleeperTickets').val(row.seniorSoftSleeperTickets);
                $('#alter_softSleeperTickets').val(row.softSleeperTickets);
                $('#alter_activelyingPosmonTickets').val(row.activelyingPosmonTickets);
                $('#alter_touristCoachTickets').val(row.touristCoachTickets);
                $('#alter_softSeatTickets').val(row.softSeatTickets);
                $('#alter_hardTickets').val(row.hardTickets);
                $('#alter_noSeatTickets').val(row.noSeatTickets);
                $('#alter_ticketsPrice').val(row.ticketsPrice);
                $('#alter_createTime').val(row.createTime);
                $('#alter_date_start').val(function () {
                    var date = new Date(row.statrtingDate);
                    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                    return date.getFullYear() + "-" + month + "-" + currentDate;
                })
            },'click .btn_detail': function (e, value, row, index) {
                $('#line_detail').modal({backdrop: 'static', keyboard: true});
                $('#line_detail').show();
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

    function refreshTable() {
        $('#table').bootstrapTable('refresh',{url: '/tickets/lines'})
    }
</script>
<script>
    $(document).ready(function () {

        $('#loading-example-btn').click(function () {
            btn = $(this);
            simpleLoad(btn, true)
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
            });
        }
    }

    /**
     * 修改表单验证
     */
    $(function () {
       $('#alter_line_form').validate({
           submitHandler:function () {
               altersave();
           },
           // debug:true,
           // onkeyup:true,
           rules:{
               trainNumber:{required:true,rangelength:[5,5]},
               stations:{required:true},
               stationTime:{required:true},
               statrtingDate:{required:true},
               businessClassTickets:{required:true,min:0},
               firstClassTickets:{required:true,min:0},
               sencondClassTickets:{required:true,min:0},
               seniorSoftSleeperTickets:{required:true,min:0},
               softSleeperTickets:{required:true,min:0},
               activelyingPosmonTickets:{required:true,min:0},
               touristCoachTickets:{required:true,min:0},
               softSeatTickets:{required:true,min:0},
               hardTickets:{required:true,min:0},
               noSeatTickets:{required:true,min:0},
               ticketsPrice:{required:true}
           }
       })
    });


    /**
     * 创建表单验证
     */

    $(function () {
        $('#create_line_form').validate({
            submitHandler:function () {
                createsave();
            },
            // debug:true,
            // onkeyup:true,
            rules:{
                trainNumber:{required:true,rangelength:[5,5]},
                stations:{required:true},
                stationTime:{required:true},
                statrtingDate:{required:true},
                businessClassTickets:{required:true,min:0},
                firstClassTickets:{required:true,min:0},
                sencondClassTickets:{required:true,min:0},
                seniorSoftSleeperTickets:{required:true,min:0},
                softSleeperTickets:{required:true,min:0},
                activelyingPosmonTickets:{required:true,min:0},
                touristCoachTickets:{required:true,min:0},
                softSeatTickets:{required:true,min:0},
                hardTickets:{required:true,min:0},
                noSeatTickets:{required:true,min:0},
                ticketsPrice:{required:true}
            }
        })
    });

    function alter_submit() {
        $('#alter_line_form').submit();
    }

    function create_submit() {
        $('#create_line_form').submit();
    }


</script>
</body>
</html>
