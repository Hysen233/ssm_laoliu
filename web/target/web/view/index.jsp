<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台首页 - QAdmin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/static/common/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/static/admin/css/style.css">
    <script src="${pageContext.request.contextPath}/view/static/common/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/view/static/common/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/static/common/vue.min.js"></script>
    <style>
        .right h2 {
            margin: 10px 0;
        }

        .right li {
            margin-bottom: 10px;
        }
    </style>
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
    </div>
</div>
<script src="${pageContext.request.contextPath}/view/static/admin/js/config.js"></script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/script.js"></script>
<script type="text/javascript">

    // //模拟登录状态,实际使用时请删除掉
    // if(!sessionStorage.isLgoin){
    //     window.location.href = 'login.html';
    // }
</script>
</body>
</html>
