<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加文章 - QAdmin后台模板</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/static/common/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/static/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/view/static/common/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/view/static/common/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/static/common/vue.min.js"></script>
</head>
<body>
<div id="app">
    <header>
        <h1 v-text="webname"></h1>
        <div class="breadcrumb">
            <i class="layui-icon">&#xe715;</i>
            <ul>
                <li v-for="vo in address">
                    <a  v-text="vo.name" :href="vo.url" ></a> <span>/</span>
                </li>
            </ul>
        </div>
    </header>
    <div class="breadcrumb">
        <i class="layui-icon">&#xe715;</i>
        <ul>
            <li v-for="vo in address">
                <a v-text="vo.name" :href="vo.url"></a> <span>/</span>
            </li>
        </ul>
    </div>
    </header>

    <div class="main" id="app">
        <!--左栏-->
        <div class="left">
            <ul class="cl">
                <!--顶级分类-->
                <li v-for="vo,index in menu" :class="{hidden:vo.hidden}">
                    <a href="javascript:;" :class="{active:vo.active}" @click="onActive(index)">
                        <i class="layui-icon" v-html="vo.icon"></i>
                        <span v-text="vo.name"></span>
                        <i class="layui-icon arrow" v-show="vo.url.length==0">&#xe61a;</i> <i v-show="vo.active"
                                                                                              class="layui-icon active">&#xe623;</i>
                    </a>
                    <!--子级分类-->
                    <div v-for="vo2,index2 in vo.list">
                        <a href="javascript:;" :class="{active:vo2.active}" @click="onActive(index,index2)"
                           v-text="vo2.name"></a>
                        <i v-show="vo2.active" class="layui-icon active">&#xe623;</i>
                    </div>
                </li>
            </ul>
        </div>
        <!--右侧-->
        <div class="right">


            <!-- 配置文件 -->
            <script type="text/javascript"
                    src="${pageContext.request.contextPath}/view/static/common/ueditor/ueditor.config.js"></script>
            <!-- 编辑器源码文件 -->
            <script type="text/javascript"
                    src="${pageContext.request.contextPath}/view/static/common/ueditor/ueditor.all.js"></script>


            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加文章</legend>
            </fieldset>


            <form class="layui-form" action="/Article/add" method="post">


                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-inline">
                        <input type="text" name="title" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">分类</label>
                    <div class="layui-input-inline" style="width: 200px">
                        <select name="columnsid">
                            <c:forEach items="${colmnuMap}" var="col">
                                <option value="${col.key.id}">${col.key.name}</option>
                                <c:forEach items="${col.value}" var="colu">
                                    <option value="${colu.id}">&nbsp;&nbsp;&nbsp;${colu.name}</option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block" style="width:1000px;">
                        <textarea id="content12" name="content" style="display: none;"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">是否置顶</label>
                    <div class="layui-input-block">
                        <input type="checkbox" value="1" name="topping" lay-text="开启|关闭" lay-skin="switch">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">是否显示</label>
                    <div class="layui-input-block">
                        <input type="checkbox" value="1" name="dispaly" lay-text="开启|关闭" checked lay-skin="switch">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="submit" lay-filter="submit">立即提交</button>

                    </div>
                </div>
            </form>


        </div>
    </div>
</div>
</body>
<script>
    layui.use('layedit',function () {
        var layedit = layui.layedit;
        let build = layedit.build('content12');
        setInterval(function () {
            layedit.sync(build)
        },500)
    })
    /*layui.use(['form', 'upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            upload = layui.upload;


        upload.render({
            elem: '#file' //绑定元素
            , url: "/admin/uploads/file.html" //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    $("#file_url").val(res.url);
                } else {
                    layer.msg(res.info, function () {
                    })
                }
            }, error: function () {
                layer.msg("上传异常");
            }
        });

        upload.render({
            elem: '#pic' //绑定元素
            , url: "/admin/uploads/pic.html" //上传接口
            , done: function (res) {
                //上传完毕回调
                if (res.code == 1) {
                    $("#pic_url").val(res.url);
                    $(".pic_url").attr("src", res.url);
                } else {
                    layer.msg(res.info, function () {
                    })
                }
            }, error: function () {
                layer.msg("上传异常");
            }
        });

        form.on('submit(submit)', function (data) {
            layer.load({time: 0});
            $.post(data.form.action, data.field, function (e) {
                layer.closeAll('loading');
                if (e.code == 1) {
                    layer.msg(e.msg, {icon: 1, shade: 0.5,});
                    setTimeout(function () {
                        window.location.href = e.url;
                    }, 1000);
                } else {
                    layer.msg(e.msg, {icon: 2, shade: 0.5, time: 2000, shadeClose: true});
                }
            })
            return false;
        });
    });*/
</script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/config.js"></script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/script.js"></script>
</html>
