<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.header{
	position:fixed;
	z-index:1;
}

 .btn3 {
	position : absolute;
	margin-top:10px;
	margin-left:70%;
    background-color:  #00004d;
    color: white;
    font-size: 15px;
    padding: 8px 25px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
}

.btn3:hover {
    background-color: #ffffff;
    color: black;
}

ul {
  list-style-type: none;
  margin: 0;
  margin-top:0px;
  margin-left:-10px;
  padding: 0;
  overflow: hidden;
  background-color: #3399ff;
  position: fixed;
  border-bottom: 1px ;
  top: 0;
  width: 100%;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  font-size:20px;
  font-family:'Roboto', sans-serif;;
  padding: 25px 16px;
  text-decoration: none;
  border-right:1px solid #8c8c8c;
  border-width: 2px;
  line-height: 5px;
  border-color:white;
  
}
li a:hover {
  background-color: #cccccc;
  color: #333333;
  text-decoration: none;
}
</style>
<script>

$('li a').on('click', function(){$(this).css("background-color","yellow");});

</script>

</head>
<body>

<div class=header>
	<ul>
	  <li><a href="analytics" >Analytics</a></li>
	  <li><a href="configure">Configuration</a></li>
	  <a href="index"><button class="btn3">logout</button></a>
	</ul>
	
	<!-- <a href="emplogin"> Logout</button></a> -->
</div>



</body>
</html>