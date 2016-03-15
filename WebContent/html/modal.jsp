<!-- MODAL-LOGIN -->
<div id="modal-login" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left:15px;margin-top:13px;color:#6A6A6A">登陆到ZHAO.REN</h4>
      <div id="mod-border" style="height:230px;top:15%;">
        <div id="submit-box">
          <div id="user-check"></div>
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

<!-- MODAL-REGISTER -->
<div id="modal-register" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left:15px;margin-top:13px;color:#6A6A6A">注册到ZHAO.REN</h4>
      <div id="mod-border" style="height:230px;top:15%;">
        <div id="submit-box">
          <div id="user-check"></div>
          <div id="check-status"></div>
          <input id="usernameR" class="input-box" type="text" placeholder="USERNAME">
          <input id="passwordR" class="input-box" type="password" placeholder="PASSWORD">
        </div>
        <a id="register-submit">注册</a>
        <!-- <a id="register">没有账号？</a> -->
        <!-- <a id="find-pass">找回密码</a> -->
      </div>
    </div>
  </div>
</div>
<!-- END-OF-MODAL-REGISTER -->


<!-- PROJECT-ADD -->
<div id="modal-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-body">
    <div id="mod-body" class="white">
      <h4 style="margin-left:15px;margin-top:13px;color:#6A6A6A">提交课程到ZHAO.REN</h4>
      <div id="mod-border" style="height:230px;top:15%;">
        <div id="submit-box">
          <div id="user-check"></div>
          <div id="check-status"></div>
          <input id="class-submit" class="box" type="text" placeholder="COURSENAME">
          <input id="teacher-submit" class="box" type="text" placeholder="TEACHER">
          <textarea id="describe-submit"></textarea>
        </div>
        <a id="course-submit">提交</a>
      </div>
    </div>
  </div>
</div>
<!-- END-OF-PROJECT-ADD -->

<!-- MODAL-VOTE -->
<div id="modal-vote" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <!-- MODAL-CONTENT -->
    <div class="modal-body">
      <div id="mod-body" class="white">
        <div id="mod-border" class="vote-border">
          <h3>为这门课程投票？</h3>
          <a id="btn-for" class="btn-select">赞</a>
          <a id="btn-post" class="btn-select">踩</a>
        </div>
      </div>
    </div>
    <!-- END-OF-MODAL-CONTENT -->
  </div>
</div>
<!-- END-OF-MODAL-VOTE -->