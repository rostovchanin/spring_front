<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <spring:url value="/resources/css/bootstrap.css" var="bootstrapCss"></spring:url>
    <link rel="stylesheet" href="${bootstrapCss}">
    <c:if test="${!empty param.additionalCss}"><link rel="stylesheet" href="${param.additionalCss}"></c:if>
    <link rel="stylesheet" href="${dashboardCss}">
    <title>${param.title}</title>
</head>
