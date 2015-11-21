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

<!-- MODAL-LOGIN -->
<div id="modal-login" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="myModalLabel" style="text-align: center">登陆</h4>
      </div>
      <div id="login-front">
        <div id="name-input">
          <form>
            <input type="text" id="username" placeholder=" username">
            <input type="password" id="password" placeholder=" password">
          </form>
        </div>
        <div style="margin-top: 35px;">
          <a id="register-btn" href="<%=hregister%>">注册</a>
          <button id="user-login" type="button" class="btn btn-primary">登陆</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- END-OF-MODAL-LOGIN -->

<!-- PROJECT-ADD -->
<!-- BUTTON-PROJECT -->
<div id="project-add">
  <a type="button" data-toggle="modal" data-target="#modal-add" href="#">创建项目</a>
</div>
<!-- END-OF-BUTTON-PROJECT -->

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
