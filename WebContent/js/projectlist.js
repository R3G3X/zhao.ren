$(document).ready(
		function() {
			$(".project-list-info").click(
					function() {
						location.href = "../../html/project/project.jsp?id="
								+ $(this).parent().attr("id");
					})
			$("#search-box-btn").click(function() {
				$.post(getRootPath() + "/jsp/project_list.jsp", {
					"pages" : 1,
					"s" : $("#psearch-box-input").val()
				}, function(data, status, xhr) {
					alert("search complete");
				}).error(function(data, status, e) {
					alert("search incomplete");
				})
			})
		})
