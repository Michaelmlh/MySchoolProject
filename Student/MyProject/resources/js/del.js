/**
 * 
 */
var del = document.querySelector("#del");
del.onclick = function() {
	if (confirm("确认删除?此操作不可逆?")) {
		return true;
	}
	return false;
}