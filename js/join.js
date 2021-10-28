function openwin(){
	window.open("zipcode.jsp", "", "width=400, height=250, resizable=no");
}

function filladd(postNum, addr){
	opener.document.joinForm.postNum.value = postNum;
	opener.document.joinForm.basic.value=addr;
	this.close();
}