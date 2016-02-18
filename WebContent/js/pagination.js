/*
* @Author: Ed_Strickland
* @Date:   2015-11-13 08:33:51
* @Last Modified by:   Ed_Strickland
* @Last Modified time: 2016-02-18 11:40:15
*/

$(document).ready(function(){
    if(window.location.pathname == "/html/courses/courses.jsp")
        var numPerPage = 9;
    else
        var numPerPage = 6;
    var numItem = $("#content-width").children().size();
    var numPage = Math.ceil(numItem / numPerPage);
    $("#currentPage").val(0);
    $("#numPerPage").val(numPerPage);
    var navHtml = '<li><a href="javascript:prev();"><</a></li>';
    var currentLink = 0;
    while (numPage > currentLink){
        navHtml += '<li class="pageLink" longdesc="'+currentLink+'"><a href="javascript:goToPage('+currentLink+');">'+(currentLink + 1)+'</a></li>';
        currentLink ++;
    }
    navHtml += '<li><a href="javascript:next();">></a></li>';
    $("#paging").html(navHtml);
    $("#paging .pageLink:first").addClass("active");
    $("#content-width").children().css("display","none");
    // alert(numPerPage);
    $("#content-width").children().slice(0,numPerPage).css("display","block");
});




function goToPage(pageNum){
    var numPerPage = parseInt($("#numPerPage").val());
    startPage = pageNum * numPerPage;
    endPage = startPage + numPerPage;
    $("#content-width").children().css("display","none").slice(startPage, endPage).css("display", "block");
    $('.pageLink[longdesc=' + pageNum +']').addClass('active').siblings('.active').removeClass('active');
    $("#currentPage").val(pageNum);
}

function prev(){
    newPage = parseInt($("#currentPage").val()) - 1;
    // alert($(".active").prev(".pageLink").length);
    if($(".active").prev(".pageLink").length == true){
        goToPage(newPage);
    }
}

function next(){
    newPage = parseInt($("#currentPage").val()) + 1;
    // alert($(".active").next(".pageLink").length);
    if($(".active").next(".pageLink").length == true){
        goToPage(newPage);
    }
}
