<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-latest.js"></script>
    <script src="js/bootstrap/3.0.3/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript" src="js/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/modal.css" rel="stylesheet" />
    <%@ include file="jsp/index_load.jsp"%>
    <script type="text/javascript" charset="utf-8">
      $(document).ready(function(){
        var inner = '<%=innerHtml%>';
        $("#content").html(inner);
        $(".text").click(function(){
          location.href ="html/project/project.jsp?courseId="+$(this).children("input").val();
        })
        $(".select-btn").click(function(){
          $("#target-course").val($(this).parent().prev().children("input").val());
          // alert($("#target-course").val());
          var title = "为"+ $(this).parent().prev().children("h3").text() +"投票";
          $("#vote-border").children("h3").text(title);
        })
      })
    </script>
    <script type="text/javascript" src="js/login1.js"></script>
    <script type="text/javascript" src="js/voteClick.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</head>

<body>
<!-- NAVBAR -->
<nav class="navbar navbar-inverse navbar-fixed-top grey-1" role="navigation">
  <div class="container grey-0"style="width:1140px;">
    <!-- NAVBAR-HEADER -->
    <div class="navbar-header">
      <!-- FOR-SMALLER -->
      <button type="button" class="navbar-toggle" data-toggle="collapse"
         data-target="#example-navbar-collapse">
         <span class="sr-only">切换导航</span>
         <span class="icon-bar"></span>
      </button>
      <!-- END-OF-FOR-SMALLER -->
      <a class="navbar-brand" href="##">ZHAO.REN</a>
    </div>
    <!-- END-OF-NAVBAR-HEADER -->

    <div class="collapse navbar-collapse" id="example-navbar-collapse">
      <!-- NAVBAR-LEFT -->
      <ul class="nav navbar-nav navbar-left">
         <li><a href="html/courses/courses.jsp">所有项目</a></li>
      </ul>
      <!-- END-OF-NAVBAR-LEFT -->

      <!-- NAVBAR-RIGHT -->
      <ul class="nav navbar-nav navbar-right" style="margin-right:10px;">
        <!-- <li id="login"><a href="html/modal/login.jsp" data-target="#modal-login" data-toggle="modal">登陆</a></li> -->
        <li id="login"><a id="login-btn" data-target="#modal-login" data-toggle="modal">登陆</a></li>
        <li id="user-info">
          <a href="#" class="dropdown-toggle hidden dropdown" data-toggle="dropdown"><b class="caret"></b>
          </a>
          <ul class="dropdown-menu">
             <li><a id="manage" class="hidden" href="html/manager/manager.jsp">管理系统</a></li>
             <li><a id="user" href="../user/user.jsp">我的主页</a></li>
             <li class="divider"></li>
             <li><a href="#" id="exit">退出登录</a></li>
          </ul>
        </li>
        <li><img id="avatar" class="img-circle hidden-xs hidden" src="img/avatar3.jpg"></li>
      </ul>
      <!-- END-OF-NAVBAR-RIGHT -->
    </div>
  </div>
</nav>
<!-- END-OF-NAVBAR -->

<!-- MODAL-LOGIN -->
<div id="modal-login" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left:15px;margin-top:13px;color:#6A6A6A">登陆到ZHAO.REN</h4>
      <div id="mod-border" style="height:230px;top:15%;">
        <div id="submit-box">
          <div id="user-check"></div>
          <div id="pass-check"></div>
          <div id="check-status"></div>
          <input id="username" class="input-box" type="text" placeholder="USERNAME">
          <input id="password" class="input-box" type="password" placeholder="PASSWORD">
        </div>
        <a id="login-submit">登陆</a>
        <a id="register" data-target="#modal-register" data-toggle="modal">没有账号？</a>
        <!-- <a id="find-pass">找回密码</a> -->
      </div>
    </div>
  </div>
</div>
<!-- END-OF-MODAL-LOGIN -->

<!-- MODAL-LOGIN -->
<div id="modal-register" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left:15px;margin-top:13px;color:#6A6A6A">注册到ZHAO.REN</h4>
      <div id="mod-border" style="height:230px;top:15%;">
        <div id="submit-box">
          <div id="user-check"></div>
          <div id="check-status"></div>
          <input id="username1" class="input-box" type="text" placeholder="USERNAME">
          <input id="password1" class="input-box" type="password" placeholder="PASSWORD">
        </div>
        <a id="register-submit">注册</a>
        <!-- <a id="register"></a> -->
        <!-- <a id="find-pass">找回密码</a> -->
      </div>
    </div>
  </div>
</div>
<!-- END-OF-MODAL-LOGIN -->

<!-- PROJECT-ADD -->

<!-- MODAL-PROJECT -->
<div id="modal-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- MODAL-HEADER -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="myModalLabel">创建新项目</h4>
      </div>
      <!-- END-OF-MODAL-HEADER -->

      <!-- MODAL-CONTENT -->
      <div class="modal-body">
        <form id="box-projectadd">
          <div class="add-right">
            <div>项目简介：</div>
            <textarea id="brief"></textarea>
          </div>
          <div class="add-left">
            <div>项目名称：</div>
            <input type="text" id="project-name" />
          </div>
          <div class="add-left">
            <div class="project-adding">创建人：</div>
            <input type="text" id="founder-name" />
          </div>
        </form>
      </div>
      <!-- END-OF-MODAL-CONTENT -->

      <!-- MODAL-FOOTER -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="change-save">提交</button>
      </div>
      <!-- END-OF-MODAL-FOOTER -->
    </div>
  </div>
</div>
<!-- END-OF-MODAL-PROJECT -->
<!-- END-OF-PROJECT-ADD -->

<!-- MODAL-VOTE -->
<div id="modal-vote" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- MODAL-CONTENT -->
        <div id="mod-body" class="white">
          <div id="mod-border" class="vote-border">
            <h3>现在加入这个项目？</h3>
            <a id="btn-for" class="btn-select">是的，我现在就想开始</a>
            <a id="btn-post" class="btn-select">不，等等再说</a>
          </div>
        </div>
      <!-- END-OF-MODAL-CONTENT -->
    </div>
  </div>
</div>
<!-- END-OF-MODAL-VOTE -->


<!-- CONTENT -->

<div id="container-content" class="grey-3">
<!-- PUT-YOUR-CODE-BELOW -->
<div class="container shadow" style="padding:0px; width:1140px;">
    <!-- TITLE -->
  <div class="grey-3">
      <div class="white shadow clearfix">
        <p style="height:65px;text-align:center;">
          <!-- <img id="title" src="img/icon.png" alt=""> -->
          <!-- <h2 id="title">ZHAO.REN</h2> -->
        </p>
      </div>
  </div>
  <!-- END-OF-TITLE -->
  <!-- SLIDE -->
  <div class="white" style="height:366px;">
      <div class="shadow">
        <div id="">
            <div>
              <div id="showcase" style="background: url(img/background-img.jpg) no-repeat fixed center center/cover;">
                  <h1>REG | EX</h1>
                  <h2>想找实验室么？想找项目做？REG|EX 是您的最佳解决方案</h2>
                  <p>
                    <a id="find-project" role="button" target="" href="html/project/projectlist.jsp">我要找项目</a>
                  </p>
              </div>
            </div>
        </div>
      </div>
  </div>
  <!-- END-OF-SLIDE -->

  <!-- CONTENT -->
  <div class="grey-3">
    <div class="clearfix">
      <div class="white clearfix">
        <div id="content" class="clearfix">
        </div>
        <a id="vote-link" href="#">>>>我要投票</a>
        <input type="hidden" id="target-course" />
      </div>
    </div>
  </div>
  <!-- END-OF-CONTENT -->

<!-- PUT-YOUR-CODE-ABOVE -->
</div>
</div>

<!-- BOTTOM -->
<div class="grey-1">
  <div class="container grey-0" style="width:1140px;">
    <div id="bottom" class="hidden-xs">
      <p>
        <br>ZHAO.REN Team. (139-169-59407)<br />中山北路 3663 号 华东师范大学<br />
      </p>
      <ul style="margin-bottom:0px;padding-bottom:20px">
        <li class="contact-left">ZHAO.REN技术交流： <span>2499128545</span>
        </li>
        <li class="contact-right">新浪微博：@ZHAO.REN</li>
      </ul>
    </div>
  </div>
</div>
<!-- END-OF-BOTTOM -->
</body>
</html>
