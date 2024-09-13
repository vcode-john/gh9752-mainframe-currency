<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Manage your Blab profile</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/pwm.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body role="document">

      <div class="container">
      
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a href="feed">Feed</a></li>
            <li role="presentation"><a href="blabbers">Blabbers</a></li>
            <li role="presentation" class="active"><a href="profile">Profile</a></li>
            <li role="presentation"><a href="logout">Logout</a></li>
          </ul>
        </nav>
        <img src="resources/images/Tokyoship_Talk_icon.svg" height="100" width="100">
      </div>
      
      
      </div>
 
    <div class="container theme-showcase" role="main">
    
      <div class="page-header">
        <h4>Profile</h4>
      </div>
   <% 
      String error = (String) request.getAttribute("error");
      if (null != error) {
   %>
      <div class="alert alert-danger" role="alert">
        <%= error %>
      </div>
   
   <%
      }
   %>
      
      <div class="row">
      
       <div class="col-md-6">
        <div class="detailBox">
         <div class="titleBox">
          <label>Your Profile</label>
         </div>
         <div class="actionBox">
          <form method="POST" action="profile"><input type="hidden" name="returnPath" value="">
           <table class="table table-condensed">
            <tbody>
             <tr>
              <td>Real Name</td>
              <td><div class="form-group"><input type="text" class="form-control" name="realName" value="<%= request.getAttribute("realName") %>"></div></td>
             </tr>
             <tr>
              <td>Blab Name</td>
              <td><div class="form-group"><input type="text" class="form-control" name="blabName" value="<%= request.getAttribute("blabName") %>"></div></td>
             </tr>
             <tr>
              <td><button type="submit" class="btn btn-primary" id="login" name="Update" value="Update">Update</button></td>
              <td></td>
             </tr>
            </tbody>
           </table>
          </form>
         </div>
        </div>
       </div>
        
       <div class="col-md-6">
        <div class="detailBox">
         <div class="titleBox">
          <label>Your Hecklers</label>
         </div>
         <div class="actionBox">
          <ul class="commentList">
              <% 
              ArrayList<Integer> hecklerId = (ArrayList<Integer>) request.getAttribute("hecklerId");
              ArrayList<String> hecklerName = (ArrayList<String>) request.getAttribute("hecklerName");
              ArrayList<String> created = (ArrayList<String>) request.getAttribute("created");
            	for (int i=0; i<hecklerId.size(); i++) {
            		
              %>
           
           <li>
            <div class="commenterImage">
             <img src="resources/images/<%= hecklerId.get(i) %>.png" />
            </div>
            <div class="blockquote">
             <p class=""><%= hecklerName.get(i) %></p> 
             <span class="date sub-text">member since <%= created.get(i) %></span><br>
            </div>
           </li>
               <%
            	}
              %>
              
                
          </ul>
         </div>
        </div>
       </div>
       
      </div> 
      
      
      
      
      
      
      
      
      
      
      
      </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="resources/js/jquery-1.11.2.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  </body>
</html>