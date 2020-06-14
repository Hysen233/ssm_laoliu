<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户列表 - QAdmin后台模板</title>
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


            <div class="layui-row">

                <div  class="layui-col-lg4" style="text-align: right;width: auto;">
                    <form action="/role/findByLike">
                    <div class="layui-input-inline" style="width: 300px">
                        <input type="text" name="roleName" value="" placeholder="角色名" class="layui-input key">
                    </div>
                    <button type="submit" class="layui-btn sou">搜索</button>

                    </form>
                </div>
            </div>

            <table class="layui-table layui-form">

                <thead>
                <tr>
                    <th><a href="?/admin/user/index/order/uid.html">UID</a></th>
                    <th>角色名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${roles.list}" var="role">
                        <tr class="id36567">
                            <td>${role.id}</td>
                            <td>${role.rolename}</td>

                            <td><a onclick="update(this)">修改</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="page">
                <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">
                    <a href="role/findByPage?pageNum=${roles.prePage}&pagrSize=${roles.pageSize}" class="layui-laypage-prev ${roles.pageNum==1?'layui-disabled':''}">上一页</a>
                    <c:forEach begin="1" end="${roles.pages}" step="1" var="page">
                        <span class="layui-laypage-curr">
                            <c:if test="${page == roles.pageNum}">
                                <em class="layui-laypage-em"></em>
                            </c:if>
                            <em>${page}</em>
                        </span>
                    </c:forEach>
                    <a href="role/findByPage?pageNum=${roles.nextPage}&pagrSize=${roles.pageSize}" class="layui-laypage-next ${roles.pageNum==roles.pages?'layui-disabled':''}">下一页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
let tr ;
    function update(a) {
        tr = a.parentNode.parentNode;
        console.log(tr);
        let b = tr.childNodes[2].innerText;
        console.log(tr.childNodes[2].innerText);
        let c = tr.firstChild.innerText;
        console.log(tr.childNodes[1].innerText);
        tr.childNodes[2].innerHTML = "<form class='layui-form' action='/role/update'>" +
            "<input name='id' type='hidden' >" +
            "<div class='layui-input-inline' style='width: 300px'>" +
            "<input type='text' name='rolename' lay-verify='required' value placeholder='' autocomplete='off' class='layui-input'>" +
            "</div><button class='layui-btn' lay-submit lay-filter='submit'>提交</button>" +
            "<button class='layui-btn' onclick='location.href=location.href' type='button'>取消</button></form>"
        var inp=document.getElementsByName("rolename")[0].value = b;
        document.getElementsByName("id")[0].value = c;
    }
</script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/config.js"></script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/script.js"></script>
</body>
</html>
