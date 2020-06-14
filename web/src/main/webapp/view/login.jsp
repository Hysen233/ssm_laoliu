<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员登陆 - QAdmin后台模板</title>
    <link rel="stylesheet" href="./static/common/layui/css/layui.css">
    <link rel="stylesheet" href="./static/admin/css/login.css">
    <script src="./static/common/layui/layui.js"></script>
</head>

<body id="login">
<div class="login">
    <h2>后台</h2>
    <form class="layui-form" method="post" action="${pageContext.request.contextPath}/login.do">
        <div class="layui-form-item">
            <input type="text" name="username" placeholder="用户名" class="layui-input">
            <i class="layui-icon input-icon">&#xe66f;</i>
        </div>
        <div class="layui-form-item">
            <input type="password" name="password" placeholder="密码"  class="layui-input">
            <i class="layui-icon input-icon">&#xe673;</i>
        </div>

        <div class="layui-form-item">
            <button style="width: 100%" type="submit" class="layui-btn" lay-submit lay-filter="login">立即登录</button>

        </div>
    </form>

    <script>

/*
        layui.use('form', function () {
            var form = layui.form,
                layer = layui.layer,
                $ = layui.jquery;


            layer.tips('无需输入,请点击登录进入后台<br/>这个tips可随时去除!', '.layui-btn', {
                tips: [3, '#333'],
                time: 0
            });

            form.on('submit(login)', function (data) {
                sessionStorage.isLgoin = 1; //模拟登录状态,实际使用时请删除掉

                layer.load({
                    shade: 0.5,
                    time: 0,
                });
                setTimeout(function () {
                    window.location.href = 'index.jsp';
                },1000)

                return false;
            });
        });*/
    </script>
</div>
</body>

</html>
