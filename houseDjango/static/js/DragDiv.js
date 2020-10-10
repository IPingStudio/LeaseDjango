
function divDragStart(event) {
	var dragTop = event.target;
	var Drag = event.target.parentNode;
	var ev = event || window.event;
	event.stopPropagation();
	var disX = ev.clientX - Drag.offsetLeft;
	var disY = ev.clientY - Drag.offsetTop;
	document.onmousemove = function(event) {
		var ev = event || window.event;
		Drag.style.left = ev.clientX - disX + "px";
		Drag.style.top = ev.clientY - disY + "px";
		dragTop.style.cursor = "move";
	};
}
function divDragEnd(event) {
		var dragTop = event.target;
        document.onmousemove = null;
        dragTop.style.cursor = "default";
}
