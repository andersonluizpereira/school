<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="School.Courses" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
    <!-- Bootstrap core CSS -->

    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <script src="Scripts/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

     <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">School Menu</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li ><a href="#">Home</a></li>
            <li class="active"><asp:HyperLink runat="server" NavigateUrl="#">Courses CRUD</asp:HyperLink> </li>
                <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Teachers <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><asp:HyperLink ID="hlCoursesCrud" runat="server" NavigateUrl="~/Courses.aspx">Teachers CRUD</asp:HyperLink></li>
              </ul>
            </li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../navbar/">Default</a></li>
            <li><a href="../navbar-static-top/">Static top</a></li>
            <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="jumbotron">
        <h1>Courses</h1>
    <form id="form1" runat="server" class="form-horizontal">
        <asp:SqlDataSource ID="CoursesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolDB %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
        <asp:GridView ID="gvCourses" runat="server" DataSourceID="CoursesSqlDataSource" AutoGenerateColumns="false" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="CourseID" HeaderText="ID" />
                <asp:BoundField DataField="CourseName" HeaderText="Name" />
                <asp:BoundField DataField="CourseDescription" HeaderText="Description" />

            </Columns>


        </asp:GridView>

    </form>


   </div>
         
    




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


    <script src="Scripts/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <script src="Scripts/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
