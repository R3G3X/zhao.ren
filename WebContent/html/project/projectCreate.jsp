<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <script src="../../js/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/jquery/jquery-latest.js"></script>
    <script src="../../js/bootstrap/3.0.3/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="../../js/default.js"></script>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/default.css" rel="stylesheet" />
    <link href="../../css/project.css" rel="stylesheet" />
    <link href="../../css/projectCreate.css" rel="stylesheet" />
</head>
<body>
<!-- NAVBAR -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <!-- NAVBAR-HEADER -->
    <div class="navbar-header">
      <!-- FOR-SMALLER -->
      <button type="button" class="navbar-toggle" data-toggle="collapse"
         data-target="#example-navbar-collapse">
         <span class="sr-only">切换导航</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
      <!-- END-OF-FOR-SMALLER -->
      <a class="navbar-brand" href="#">Zhao.ren</a>
    </div>
    <!-- END-OF-NAVBAR-HEADER -->

    <div class="collapse navbar-collapse" id="example-navbar-collapse">
      <!-- NAVBAR-LEFT -->
      <ul class="nav navbar-nav navbar-left">
         <li class="active"><a href="#">所有项目</a></li>
         <li><a href="#">所有小组</a></li>
      </ul>
      <!-- END-OF-NAVBAR-LEFT -->

      <!-- NAVBAR-RIGHT -->
      <ul class="nav navbar-nav navbar-right">
        <li id="login" class="hidden"><a href="#" type="button" data-toggle="modal" data-target="#modal-login">登陆</a></li>
        <li id="user-info">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">机制汇<b class="caret"></b>
          </a>
          <ul class="dropdown-menu">
             <li><a href="#">我的主页</a></li>
             <li class="divider"></li>
             <li><a href="#">退出登录</a></li>
          </ul>
        </li>
        <li><img id="avatar" class="img-circle hidden-xs" src="avatar3.jpg"></li>
      </ul>
      <!-- END-OF-NAVBAR-RIGHT -->
    </div>
  </div>
</nav>
<!-- END-OF-NAVBAR -->



<!-- CONTENT -->
<div id="container-content">
  <!-- PUT-YOUR-CODE-BELOW -->
  <div class="grey-3" style="min-height:830px;">
    <div class="container white shadow" style="min-height:830px;">
      <div class="project-create">
        <div class="project-create-box">
            <h3>创建项目</h3>
            <p class="project-create-info-grey">*项目类型（BETA中不提供此项选择）</p>
            <p class="project-create-info">*项目名称</p>
            <input class="project-create-input-short" type="text" id="projectname" value=""/>
            <p class="project-create-info">*技术需求</p>
            <div>
              <a href="#" class="project-create-info-skill"><span id="0" class="require label label-default">JAVA</span></a>
              <a href="#" class="project-create-info-skill"><span id="0" class="require label label-default">C++</span></a>
              <a href="#" class="project-create-info-skill"><span id="0" class="require label label-default">J2EE</span></a>
              <a href="#" class="project-create-info-skill"><span id="0" class="require label label-default">PHP</span></a>
              <a href="#" class="project-create-info-skill"><span id="0" class="require label label-default">...</span></a>
            </div>
            <p class="project-create-info"*>人数需求</p>
            <input class="project-create-input-short" type="text" id="projectMenRequired" value=""/>
            <p class="project-create-info">*开发周期</p>
            <input class="project-create-input-short" type="text" id="projectDevelopTime" value=""/>
            <p class="project-create-info">*项目简介</p>
            <input class="project-create-input-short" type="text" id="projectDescribe" value=""/>
            <p class="project-create-info">详细介绍（方便队友更方便地了解你的需求）</p>
            <textarea class="project-create-input-long" id="projectDescribeInDetails"></textarea>
        </div>
        <div class="project-create-btn-div">
          <a class="project-create-btn" href="#">确认信息</a>
        </div>
      </div>
    </div>
  </div>


  <!-- PUT-YOUR-CODE-ABOVE -->
</div>
<!-- END-OF-CONTENT -->

<!-- BOTTOM -->
<div id="bottom" class="hidden-xs grey-0">
  <p>
    <br>REGEX Team. (153-006-81187)<br />中山北路 3663 号 华东师范大学<br />
  </p>
  <ul>
    <li class="contact-left">REGEX技术交流群： <span>484366879</span>
    </li>
    <li class="contact-right">新浪微博：@REGEX</li>
  </ul>
</div>
<!-- END-OF-BOTTOM -->
</body>
</html>
