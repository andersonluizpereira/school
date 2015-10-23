<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teachers_Insert.aspx.cs" Inherits="School.Teachers_Insert" %>

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
            <li class="active"><asp:HyperLink runat="server" NavigateUrl="#">Teachers CRUD</asp:HyperLink> </li>
                <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Teachers <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><asp:HyperLink ID="hlTeachers" runat="server" NavigateUrl="~/Teachers.aspx">Teachers CRUD</asp:HyperLink></li>
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
        <h1>Insert Teachers</h1>
    <form id="form1" runat="server" class="form-horizontal">
    <div>
    <fieldset>

<!-- Form Name -->
<legend>Creating</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">First Name</label>  
  <div class="col-md-4">
         <asp:TextBox ID="txtFirstName" runat="server" class="form-control input-md" placeholder="First Name" required autofocus> </asp:TextBox>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Last Name</label>  
  <div class="col-md-4">
        <asp:TextBox ID="txtLastName" runat="server" class="form-control input-md" placeholder="Last Name" required > </asp:TextBox>
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Departament</label>  
  <div class="col-md-4">
       <asp:TextBox ID="txtDepartament" runat="server" class="form-control input-md" placeholder="Departament" required > </asp:TextBox>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">E-Mail</label>  
  <div class="col-md-8">
  <asp:TextBox ID="inputEmail" runat="server" class="form-control input-md" placeholder="Email address" required > </asp:TextBox>
      
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="passwordinput">Password</label>
  <div class="col-md-4">
     <asp:TextBox ID="inputPassword" runat="server" class="form-control input-md" placeholder="Password" required TextMode="Password"></asp:TextBox>

  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="button1id">Actions</label>
  <div class="col-md-8">
    

       <asp:Button ID="btnInsert"  class="btn btn-success" runat="server" Text="Save" OnClick="btnInsert_Click"/>
      <asp:Button ID="btnBack"  class="btn btn-danger" runat="server" Text="Back" OnClick="btnBack_Click"  />
  </div>
</div>

</fieldset>

    </div>
        
            <br />
            
                <asp:Label ID="lblMsg" runat="server" class="form-signin-heading" ></asp:Label>
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
