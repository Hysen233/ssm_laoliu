<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台首页 - QAdmin后台模板</title>
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

    <div class="main" id="app">
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

            <a href="flink_add.jsp" class="layui-btn"><i class="layui-icon">&#xe654;</i>添加友情</a>
            <table class="layui-table layui-form">
                <colgroup>
                    <col width="50">
                    <col width="60">

                    <col width="180">
                    <col width="280">
                    <col>
                    <col width="120">
                    <col width="150">
                    <col width="80">
                    <col width="180">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>网站名称</th>
                    <th>连接</th>
                    <th>描述</th>
                    <th>联系人</th>
                    <th>联系QQ</th>
                    <th>显示</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${linkss}" var="li">
                <tr class="id35">
                    <td>${li.id}</td>
                    <td>${li.name}</td>
                    <td><a href="${li.url}" target="_blank">${li.url}</a></td>
                    <td>${li.desc}</td>
                    <td>${li.contactperson}</td>
                    <td>${li.qq}</td>
                    <td>${li.dispaly==1?'<span class="layui-badge layui-bg-green">开启</span>':"<span class='layui-badge'>关闭</span>"}</td>
                    <td>${li.data}</td>
                    <td><a href="/link/findByid?id=${li.id}">修改</a> | <a data-id=".id35"  href="/admin/flink/del/id/35.html">删除</a></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/view/static/admin/js/config.js"></script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/script.js"></script>
</body>
</html>
