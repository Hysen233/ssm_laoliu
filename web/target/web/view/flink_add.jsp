
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
                        <i class="layui-icon arrow" v-show="vo.url.length==0">&#xe61a;</i>
                        <i v-show="vo.active" class="layui-icon active">&#xe623;</i>
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

            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加友情</legend>
            </fieldset>
            <form class="layui-form " action="/link/add">
                <div class="layui-form-item">
                    <label class="layui-form-label">友情名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">连接地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="url"  placeholder="" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="desc"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系人</label>
                    <div class="layui-input-block">
                        <input type="text" name="contactperson"  placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系QQ</label>
                    <div class="layui-input-block">
                        <input type="text" name="qq"  placeholder="" autocomplete="off" class="layui-input">
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
                        <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>

                    </div>
                </div>
            </form>


        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/view/static/admin/js/config.js"></script>
<script src="${pageContext.request.contextPath}/view/static/admin/js/script.js"></script>
</body>
</html>
