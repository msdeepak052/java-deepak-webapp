<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DevOps Engineer - Deepak</title>
    <link href="images/deepakdevops.jpg" rel="icon">
    <script type="text/javascript">
        function updateClock() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            var ampm = hours >= 12 ? 'PM' : 'AM';
            hours = hours % 12;
            hours = hours ? hours : 12; // the hour '0' should be '12'
            minutes = minutes < 10 ? '0' + minutes : minutes;
            seconds = seconds < 10 ? '0' + seconds : seconds;
            var strTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
            document.getElementById('clock').innerHTML = strTime;
            setTimeout(updateClock, 1000);
        }
        window.onload = updateClock;
    </script>
</head>
<body>
    <h1 align="center">DevOps Engineer Enthusiast - Deepak Yadav</h1>
    <h2 align="center"> Learning DevOps: Tools - AWS, Kubernetes, Docker, Azure, CI/CD, Terraform, Ansible</h2>
    <hr>
    <h3>Server Information:</h3>
    <p>Server IP Address: 
    <% 
    InetAddress inetAddress = InetAddress.getLocalHost();
    String ip = inetAddress.getHostAddress();
    out.println("Server Hostname: " + inetAddress.getHostName()); 
    out.println("Server IP Address: " + ip);
    %>
    </p>
    <p>Client IP Address: <%= request.getRemoteAddr() %></p>
    <hr>
    
    <div style="text-align: center;">
        <h3>Current Time:</h3>
        <p id="clock" style="font-size: 24px; font-weight: bold;"></p>
    </div>
    
    <hr>
    <div style="text-align: center;">
        <img src="images/deepakdevops.jpg" alt="DevOps Engineer" width="100">
        <h3>Contact: Deepak Yadav</h3>
        <a href="mailto:yadav.deepak012@gmail.com">Email Me</a>
    </div>
    <hr>
    <p align="center"><a href="services/employee/getEmployeeDetails">Get Employee Details</a></p>
</body>
</html>
