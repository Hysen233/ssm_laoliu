<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>栏目管理 - QAdmin后台模板</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/static/common/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/static/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/view/static/common/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/view/static/common/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/static/common/vue.min.js"></script>
</head>
<body>
<div id="app">
    <!--顶栏-->
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

    <div class="main">
        <!--左栏-->
        <div class="left">
            <ul class="cl" >
                <!--顶级分类-->
                <li v-for="vo,index in menu" :class="{hidden:vo.hidden}">
                    <a href="javascript:;"  :class="{active:vo.active}"  @click="onActive(index)">
                        <i class="layui-icon" v-html="vo.icon"></i>
                        <span v-text="vo.name"></span>
                        <i class="layui-icon arrow" v-show="vo.url.length==0">&#xe61a;</i> <i v-show="vo.active" class="layui-icon active">&#xe623;</i>
                    </a>
                    <!--子级分类-->
                    <div v-for="vo2,index2 in vo.list">
                        <a href="javascript:;" :class="{active:vo2.active}" @click="onActive(index,index2)" v-text="vo2.name"></a>
                        <i v-show="vo2.active" class="layui-icon active">&#xe623;</i>
                    </div>
                </li>
            </ul>
        </div>
        <!--右侧-->
        <div class="right">
            <a href="/Columns/toAdd" class="layui-btn"><i class="layui-icon">&#xe654;</i>添加栏目</a>
            <table class="layui-table layui-form">
                <colgroup>
                    <col width="80">
                    <col width="80">
                    <col width="150">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col>
                    <col width="150">
                </colgroup>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>名称</th>
                    <th>英文名</th>
                    <th>显示</th>

                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${columnsMap}" var="column">
                    <tr class="id9">
                        <td>
                            ${column.key.id}
                        </td>
                        <td>
                            ${column.key.name}
                        </td>
                        <td>
                            ${column.key.englishname}
                        </td>
                        <td>${column.key.dispaly==1?'<span class="layui-badge layui-bg-green">开启</span>':"<span class='layui-badge'>关闭</span>"}</td>

                        <td><a href="/Columns/findByid?id=${column.key.id}">修改</a> | <a data-id=".id9"  href="/Columns/delete?id=${column.key.id}">删除</a></td>
                    </tr>
                    <c:forEach items="${column.value}" var="list">
                        <tr class="id9">
                            <td>${list.id}</td>
                            <td>|----------${list.name}</td>
                            <td>${list.englishname}</td>
                            <td>${column.key.dispaly==1?'<span class="layui-badge layui-bg-green">开启</span>':"<span class='layui-badge'>关闭</span>"}</td>

                            <td><a href="/Columns/findByid?id=${list.id}">修改</a> | <a  data-id=".id11" href="/Columns/delete?id=${list.id}">删除</a></td>
                        </tr>
                    </c:forEach>
                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    layui.use('form', function () {
        var form = layui.form, layer = layui.layer, $ = layui.jquery;

        form.on('switch(state)', function(data) {
            var id = $(data.elem).attr("data-id");
            $.ajax({
                url: "/admin/category/state/type/state.html",
                data: {
                    id: id,
                },
                type: "get",
                dataType: "json",
                success: function(e) {
                    if (e.code== 1) {
                        layer.msg(e.msg, {
                            icon: 1
                        });
                    } else {
                        layer.msg(e.msg, {
                            icon: 2,
                            shade: 0.5,
                            time: 2000,
                            shadeClose: true
                        });
                    }
                }
            });
        });

    });
</script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/config.js"></script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/script.js"></script>
</body>
</html>

