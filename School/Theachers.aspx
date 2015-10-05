<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Theachers.aspx.cs" Inherits="School.Theachers" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Teachers</title>

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
                    <li><a href="#">Home</a></li>
                    <li class="active">
                        <asp:HyperLink ID="hlTeachers" runat="server" NavigateUrl="~/Theachers.aspx">Teachers</asp:HyperLink></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../navbar/">Default</a></li>
                    <li><a href="../navbar-static-top/">Static top</a></li>
                    <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <div class="jumbotron">
        <h1>Teachers</h1>

        <p>
            <form class="form-signin" id="form1" runat="server">

                <div class='portlet-body form'>

                    <p>
                        <asp:Button ID="btnInsert" class="btn btn-lg btn-primary btn-block" runat="server" Text="Insert New Teacher" OnClick="btnInsert_Click" />

                    </p>
                    <p>
                    <div class="form-group">
  <label class="col-md-10 control-label" for="textinput">Filter by Last Name:</label>  
  <div class="col-md-10">
        <asp:TextBox ID="txtFilterLastName" runat="server" class="form-control input-md" placeholder="Last Name" required > </asp:TextBox>
    
  </div>
</div>
                        <br />
                         </p>
                   
                    <p>
                    <div class="form-group">
  <label class="col-md-10 control-label" for="button1id">Actions</label>
  <div class="col-md-8">
    

       <asp:Button ID="btnFilterLastName"  class="btn btn-success" runat="server" Text="Filter" OnClick="btnFilterLastName_Click" />
      <asp:Button ID="btnResetLastName"  class="btn btn-danger" runat="server" Text="Reset" OnClick="btnResetLastName_Click" />
  </div>
</div>
                        </p>
                    <br /><br /><br /><br /><br /><br />
                    <div class="table-responsive">
                        <table class="table">
                    <asp:GridView ID="gvTeachers" runat="server" Width="500px" AutoGenerateColumns="False" AllowPaging="true" PageSize="8" AllowSorting="true" DataKeyNames="TeacherID" HorizontalAlign="Center" OnRowCancelingEdit="gvTeachers_RowCancelingEdit" OnRowEditing="gvTeachers_RowEditing" OnRowUpdating="gvTeachers_RowUpdating" OnRowDeleting="gvTeachers_RowDeleting" OnPageIndexChanging="gvTeachers_PageIndexChanging" OnSorting="gvTeachers_Sorting">

                        <Columns>
                            <asp:TemplateField HeaderText="ID" SortExpression="TeacherID">
                                <ItemTemplate><%#Eval("TeacherID") %></ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Last Name" SortExpression="TeacherLastName">
                                <ItemTemplate><%#Eval("TeacherLastName") %></ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLastName" runat="server" Text='<%#Eval("TeacherLastName") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="First Name" SortExpression="TeacherFirstName">
                                <ItemTemplate><%#Eval("TeacherFirstName") %></ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%#Eval("TeacherFirstName") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Date Join" SortExpression="TeacherDateJoin">
                                <ItemTemplate><%#Eval("TeacherDateJoin") %></ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDateJoin" runat="server" Text='<%#Eval("TeacherDateJoin") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Department" SortExpression="TeacherDepartment">
                                <ItemTemplate><%#Eval("TeacherDepartment") %></ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDepartment" runat="server" Text='<%#Eval("TeacherDepartment") %>'></asp:TextBox>
                                </EditItemTemplate>

                                <HeaderTemplate>
                                    <asp:LinkButton ID="linkDepartment" runat="server" Text="Department" CommandName="Sort" CommandArgument="TeacherDepartment">

                                    </asp:LinkButton>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="true" OnPreRender="ddlDepartment_SetValue" OnSelectedIndexChanged="ddlDepartment_IndexChanged">
                                        <asp:ListItem text="All" Value="All" Selected="True"/>
                                        <asp:ListItem text="Biology" Value="Biology"/>
                                        <asp:ListItem text="Chemical" Value="Chemical" />
                                        <asp:ListItem text="Literature" Value="Literature" />
                                        <asp:ListItem text="Mathematics" Value="Mathematics" />
                                        <asp:ListItem text="Physics" Value="Physics" />
                                        <asp:ListItem text="Science" Value="Science" />
                                    </asp:DropDownList>
                                </HeaderTemplate>

                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="true" ButtonType="Link" />
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Link" />

                        </Columns>

                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="3" FirstPageText="First" LastPageText="Last" />

                    </asp:GridView>
 </div>
                        </div>
                </div>
            </form>
        </p>

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
