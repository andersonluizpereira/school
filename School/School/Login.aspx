<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="School.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/ie-emulation-modes-warning.js"></script>
</head>
<body>


    <!--Pulling Awesome Font -->


    <div class="container">

        <form class="form-signin" id="form1" runat="server">
            <h2 class="form-signin-heading">Please sign in</h2>


            <label for="inputEmail" class="sr-only">Email address</label>

            <asp:TextBox ID="inputEmail" runat="server" class="form-control" placeholder="Email address" required autofocus> </asp:TextBox>
            <label for="inputPassword" class="sr-only">Password</label>
            <asp:TextBox ID="inputPassword" runat="server" class="form-control" placeholder="Password" required TextMode="Password"></asp:TextBox>

            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
            </div>
            
            <asp:Button ID="btnLogin"  class="btn btn-lg btn-primary btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />

            <br />
            
                <asp:Label ID="lblMsg" runat="server" class="form-signin-heading" ></asp:Label>

            
        </form>

    </div>
    <!-- /container -->
</body>
<script src="Scripts/ie10-viewport-bug-workaround.js"></script>
</html>
