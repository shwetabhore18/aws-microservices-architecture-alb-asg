#!/bin/bash
yum install -y httpd
systemctl start httpd
systemctl enable httpd

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Home Microservice</title>
<style>
body {
    margin:0;
    font-family: Arial;
    background: linear-gradient(135deg,#1e3c72,#2a5298);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    color:white;
}
.card {
    background:rgba(255,255,255,0.1);
    padding:40px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 8px 20px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<div class="card">
<h1>🏠 Home Microservice</h1>
<p><b>Instance ID:</b> $INSTANCE_ID</p>
<p>Auto Scaling Enabled</p>
</div>
</body>
</html>
EOF