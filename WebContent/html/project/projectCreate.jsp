<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="/jsp/frame.jsp"%>
  <%@ include file="/html/frame/frame_head.jsp"%>
  <link href="../../css/projectCreate.css" rel="stylesheet" />
</head>
<body>
<!-- NAVBAR -->
<%@ include file="/html/frame/frame_navbar.jsp"%>
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
<jsp:include page="../../html/frame/frame_bottom.jsp"></jsp:include>
<!-- END-OF-BOTTOM -->
</body>
</html>
