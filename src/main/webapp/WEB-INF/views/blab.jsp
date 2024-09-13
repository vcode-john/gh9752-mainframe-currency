<%@ page language="java" contentType="text/html; charset=US-ASCII"  pageEncoding="US-ASCII"%>
<%@ page import="com.veracode.verademo.utils.*" %>
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

    <title>Blab</title>

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
            <li role="presentation"><a href="profile">Profile</a></li>
            <li role="presentation"><a href="logout">Logout</a></li>
          </ul>
        </nav>
        <img src="resources/images/Tokyoship_Talk_icon.svg" height="100" width="100">
      </div>
      
      
      </div>
 
    <div class="container theme-showcase" role="main">
    
      <div class="page-header">
        <h4><%= request.getAttribute("blab_name") %> says...</h4>
      </div>
      <div>
    <blockquote>
        <h3><%=request.getAttribute("content") %></h3>
    </blockquote>
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
            <label>Comments</label>
          </div>
            <div class="actionBox">
            <form class="form-inline" role="form" method="POST" action="blab">
              <div class="form-group">
                <input class="form-control" type="text" placeholder="Add a comment now..." name="comment" />
              </div>
              <div class="form-group">
                <button class="btn btn-default">Add</button>
              </div>
              <input type="hidden" name="blabid" value="<%= request.getAttribute("blabid") %>" >
            </form>
              <ul class="commentList">
              <% 
              ArrayList<Integer> commenterID = (ArrayList<Integer>) request.getAttribute("commenterId");
              ArrayList<String> commenterName = (ArrayList<String>) request.getAttribute("commenterName");
              ArrayList<String> comment = (ArrayList<String>) request.getAttribute("comment");
              ArrayList<String> timestamp = (ArrayList<String>) request.getAttribute("timestamp");
            	for (int i=0; i<commenterID.size(); i++) {
              %>
                <li>
                  <div class="commenterImage">
                    <img src="resources/images/<%= commenterID.get(i) %>.png" />
                  </div>
                  <div class="blockquote">
                    <p class="">"<%= comment.get(i) %>"</p> 
                    <span class="date sub-text">by <%= commenterName.get(i) %> on <%= timestamp.get(i) %></span><br>
                  </div>
                </li>
              <%
            	}
              %>
              
              
                
              </ul>
          </div>
        </div>
      </div>        
      <div class="col-md-3">
        </div>
        <div class="col-md-3">
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