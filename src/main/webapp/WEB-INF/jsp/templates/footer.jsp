<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/js/jquery-3.4.1.min.js" var="jqueryJs"></spring:url>
<spring:url value="/resources/js/popper.min.js" var="popperJs"></spring:url>
<spring:url value="/resources/js/bootstrap.js" var="bootstrapJs"></spring:url>
<spring:url value="/resources/js/main.js" var="mainJs"></spring:url>
<script src="${jqueryJs}" ></script>
<script src="${popperJs}" ></script>
<script src="${bootstrapJs}" ></script>
<script src="${mainJs}" ></script>


