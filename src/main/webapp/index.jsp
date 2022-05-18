<!DOCTYPE html>
<html>
<head>
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.thumbnail {
    width: 320px;
    height: 240px;
}

.image {
    width: 100%;
    height: 100%;    
}

.image img {
    -webkit-transition: all 1s ease; /* Safari and Chrome */
    -moz-transition: all 1s ease; /* Firefox */
    -ms-transition: all 1s ease; /* IE 9 */
    -o-transition: all 1s ease; /* Opera */
    transition: all 1s ease;
}

.image:hover img {
    -webkit-transform:scale(1.25); /* Safari and Chrome */
    -moz-transform:scale(1.25); /* Firefox */
    -ms-transform:scale(1.25); /* IE 9 */
    -o-transform:scale(1.25); /* Opera */
     transform:scale(1.25);
}

.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 100%;
}

</style>
</head>
<body>
hello
	</br>
<%
java.util.Properties prop = new java.util.Properties();
prop.load(getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF"));
String applVersion = prop.getProperty("version"); 
%>
	<div style="text-align:center"><h1>DevOps <%=applVersion%>!</h1></div>
	</br>
    <table align="center" style="width:100%">
         <tr>
            <td>
               <img src="devops.jpg" alt="devops" width="100%">
            </td>
            <td>
                <img src="jenkins_is_the_hub_CD_Devops.png" alt="devops" width="100%">
            </td>
         </tr>
         <tr>
            <td>
               <img src="cicd-tools.jpg" alt="devops" width="100%">
            </td>
            <td>
                <img src="devops-tools.png" alt="devops" width="100%">
            </td>
         </tr>
         </tr>
    </table>
</body>
