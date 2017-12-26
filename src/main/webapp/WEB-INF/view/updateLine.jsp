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
                <form class="form-horizontal" id="create_form">

                    <div class="form-group" hidden="hidden">
                            <input type="text" class="form-control" name="id">
                    </div><div class="hr-line-dashed"></div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车次编辑</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="trainNumber"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点编辑</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="stations"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点到达时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="stationTime"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <%--<div class="form-group">--%>
                        <%--<label class="col-sm-2 control-label">历经时间</label>--%>
                        <%--<div class="col-sm-10">--%>
                            <%--<input type="text" class="form-control"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>--%>
                        <%--</div>--%>
                    <%--</div><div class="hr-line-dashed"></div>--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出发日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="date_start" class="laydate-icon form-control layer-date" name="statrtingDate"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商务座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="businessClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">一等座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="firstClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二等座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="sencondClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">高级软卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="seniorSoftSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="softSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">动卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="activelyingPosmonTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="touristCoachTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="softSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="hardTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">无座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="noSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">票价编辑</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="ticketsPrice"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="btn_alter_close" type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="ceate_save()">创建</button>
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
                <form>
                    <div class="form-group" hidden="hidden">
                        <input type="text" class="form-control" name="id">
                    </div><div class="hr-line-dashed"></div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车次编辑</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="trainNumber" id="trainNumber"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点编辑</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="stations" id="stations"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">站点到达时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="stationTime" id="stationTime"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">历经时间</label>--%>
                    <%--<div class="col-sm-10">--%>
                    <%--<input type="text" class="form-control"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>--%>
                    <%--</div>--%>
                    <%--</div><div class="hr-line-dashed"></div>--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出发日期</label>
                        <div class="col-sm-10">
                            <input type="text" id="date" class="laydate-icon form-control layer-date" name="statrtingDate"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商务座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="businessClassTickets" id="businessClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">一等座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="firstClassTickets" id="firstClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二等座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="sencondClassTickets" id="sencondClassTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">高级软卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="seniorSoftSleeperTickets" id="seniorSoftSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="softSleeperTickets" id="softSleeperTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">动卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="activelyingPosmonTickets" id="activelyingPosmonTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬卧</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="touristCoachTickets" id="touristCoachTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">软座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="softSeatTickets" id="softSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="hardTickets" id="hardTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div><div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">无座</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="noSeatTickets" id="noSeatTickets"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">票价编辑</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="ticketsPrice" id="ticketsPrice"> <span class="help-block m-b-none">帮助文本，可能会超过一行，以块级元素显示</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createsave()">创建</button>
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
        elem: '#date_start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
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
            var trainNumber=$("#trainNumber").val();
            var stations=$("#stations").val();
            var stationTime=$("#stationTime").val();
            // var statrtingDate=$("input[name='statrtingDate']").val();
            var businessClassTickets=$("#businessClassTickets").val();
            var firstClassTickets=$("#firstClassTickets").val();
            var sencondClassTickets=$("#sencondClassTickets").val();
            var seniorSoftSleeperTickets=$("#seniorSoftSleeperTickets").val();
            var softSleeperTickets=$("#softSleeperTickets").val();
            var activelyingPosmonTickets=$("#activelyingPosmonTickets").val();
            var touristCoachTickets=$("#touristCoachTickets").val();
            var softSeatTickets=$("#softSeatTickets").val();
            var hardTickets=$("#hardTickets").val();
            var noSeatTickets=$("#noSeatTickets").val();
            var ticketsPrice=$("#ticketsPrice").val();
            var data={'trainNumber':trainNumber,'stations':stations,'stationTime':stationTime
                ,'businessClassTickets':businessClassTickets,'firstClassTickets':firstClassTickets,'sencondClassTickets':sencondClassTickets,'seniorSoftSleeperTickets':seniorSoftSleeperTickets
                ,'softSleeperTickets':softSleeperTickets,'activelyingPosmonTickets':activelyingPosmonTickets,'touristCoachTickets':touristCoachTickets,'softSeatTickets':softSeatTickets,
                'hardTickets':hardTickets,'noSeatTickets':noSeatTickets,'ticketsPrice':ticketsPrice};
            console.info(data);
            $.ajax({
                url:'/tickets/create',
                type:'post',
                data:data,
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
            var id=$("input[name='id']").val();
            var trainNumber=$("input[name='trainNumber']").val();
            var stations=$("input[name='stations']").val();
            var stationTime=$("input[name='stationTime']").val();
            // var statrtingDate=$("input[name='statrtingDate']").val();
            var businessClassTickets=$("input[name='businessClassTickets']").val();
            var firstClassTickets=$("input[name='firstClassTickets']").val();
            var sencondClassTickets=$("input[name='sencondClassTickets']").val();
            var seniorSoftSleeperTickets=$("input[name='seniorSoftSleeperTickets']").val();
            var softSleeperTickets=$("input[name='softSleeperTickets']").val();
            var activelyingPosmonTickets=$("input[name='activelyingPosmonTickets']").val();
            var touristCoachTickets=$("input[name='touristCoachTickets']").val();
            var softSeatTickets=$("input[name='softSeatTickets']").val();
            var hardTickets=$("input[name='hardTickets']").val();
            var noSeatTickets=$("input[name='noSeatTickets']").val();
            var ticketsPrice=$("input[name='ticketsPrice']").val();
            var data={'id':id,'trainNumber':trainNumber,'stations':stations,'stationTime':stationTime
            ,'businessClassTickets':businessClassTickets,'firstClassTickets':firstClassTickets,'sencondClassTickets':sencondClassTickets,'seniorSoftSleeperTickets':seniorSoftSleeperTickets
            ,'softSleeperTickets':softSleeperTickets,'activelyingPosmonTickets':activelyingPosmonTickets,'touristCoachTickets':touristCoachTickets,'softSeatTickets':softSeatTickets,
            'hardTickets':hardTickets,'noSeatTickets':noSeatTickets,'ticketsPrice':ticketsPrice};
            console.info(data);
            $.ajax({
                url:'/tickets/update',
                type:'post',
                data:data,
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
                $('#myModal').modal({backdrop: 'static', keyboard: true});
                $('#myModal').show();
                $("input[name='id']").val(row.id);
                $("input[name='trainNumber']").val(row.trainNumber);
                $("input[name='stations']").val(row.stations);
                $("input[name='stationTime']").val(row.stationTime);
                // $("input[name='arrivadeTime']").val(row.arrivadeTime);
                // $("input[name='statrtingDate']").val(row.statrtingDate);
                $("input[name='businessClassTickets']").val(row.businessClassTickets);
                $("input[name='firstClassTickets']").val(row.firstClassTickets);
                $("input[name='sencondClassTickets']").val(row.sencondClassTickets);
                $("input[name='seniorSoftSleeperTickets']").val(row.seniorSoftSleeperTickets);
                $("input[name='softSleeperTickets']").val(row.softSleeperTickets);
                $("input[name='activelyingPosmonTickets']").val(row.activelyingPosmonTickets);
                $("input[name='touristCoachTickets']").val(row.touristCoachTickets);
                $("input[name='softSeatTickets']").val(row.softSeatTickets);
                $("input[name='hardTickets']").val(row.hardTickets);
                $("input[name='noSeatTickets']").val(row.noSeatTickets);
                $("input[name='ticketsPrice']").val(row.ticketsPrice);
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
</body>
</html>
