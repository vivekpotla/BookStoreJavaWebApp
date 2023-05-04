package com.javaproject;

public class Snippet {
	<%
		String msg = request.getParameter("msg");
		if ("valid".equals(msg)) {
	%>
	<script>
		alert("Registration Successfully..");
		window.location.assign("login.jsp");
	</script>
	<%
		}
	%>
}

