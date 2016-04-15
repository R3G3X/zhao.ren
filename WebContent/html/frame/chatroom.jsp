<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!-- CHATROOM -->
<a id="btn-chat" class="hidden">私信聊天</a>

<div id="chatroom" class="hidden">
  <div id="chatroom-left">
    <div id="chatroom-left-title">
      <p>私信聊天</p>
    </div>
    <div id="chatroom-left-content">
      <ul id="chatroom-left-userlist">
        <li class="chatroom-left-userlist-item item-activated">
          <a class="id">1</a>
          <a class="btn-delete">×</a>
        </li>
        <li class="chatroom-left-userlist-item item-deactivated">
          <a class="id">2</a>
          <a class="btn-delete">×</a>
        </li>
        <li class="chatroom-left-userlist-item item-deactivated">
          <a class="id">9</a>
          <a class="btn-delete">×</a>
        </li>
      </ul>
    </div>
  </div>
  <div id="chatroom-right">
    <div id="chatroom-right-title">
      <div id="chatroom-right-title-content">
        <p>正在与</p><a id="toName"></a><p>进行对话</p>
      </div>
      <a id="btn-minimize">—</a>
    </div>
    <div id="target-message" class="target-message hidden">
    </div>
    <div id="target-message-1" class="target-message">
    </div>
    <div id="target-message-2" class="target-message hidden">
    </div>
    <div id="target-message-9" class="target-message hidden">
    </div>
    <div id="message-input">
      <textarea id="message"></textarea>
      <a id="btn-send">发送</a>
      <p id="alert">ctrl + enter 发送</p>
    </div>
  </div>
</div>
<!-- END-OF-CHATROOM -->

