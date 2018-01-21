$("#yybg").click(function () {
	$("#sssj").removeClass("active");
    $("#sssjDiv").hide();
    $("#yybg").addClass("active");
    $("#yybgDiv").show();
});
$("#sssj").click(function () {
    $("#yybg").removeClass("active");
    $("#yybgDiv").hide();
    $("#sssj").addClass("active");
    $("#sssjDiv").show();
});