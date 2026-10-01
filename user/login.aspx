<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
.login
{
    height:500px;
    width:425px;
}
.l1
{
    font-size:90px;
}
</style>

    

  <section class="book_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <div class="align-self-end">
                <asp:Label ID="lbmsg" runat="server"></asp:Label>
            </div>

            
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form_container">
                <img src="../temp/images/product/logingif.gif" class="login" />
                
                </div>
            </div>

            <div class="col-md-6">
                <div class="form_container">
                    <div>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br /><br />
                    <h1 class="l1">Login</h1><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br /><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required" ControlToValidate="txtusername"  Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    </div>

                    <div>
                        <asp:RequiredFieldValidator ID="rfvpasssword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtpassword"  Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="revpass1" runat="server" ErrorMessage="Password must be at least 8 characters long." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpassword" ValidationExpression="^.{8,}$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass2" runat="server" ErrorMessage="Password must contain at least one uppercase letter." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpassword" ValidationExpression="^(?=.*[A-Z]).*$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass3" runat="server" ErrorMessage="Password must contain at least one lowercase letter." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpassword" ValidationExpression="^(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass4" runat="server" ErrorMessage="Password must contain at least one digit." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpassword" ValidationExpression="^(?=.*\d).*$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass5" runat="server" ErrorMessage="Password must contain at least one special character." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpassword" ValidationExpression="^(?=.*[@$!%*?&]).*$"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                       
                    </div>
                    <div>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/user/forgetpass.aspx">Forget Password</asp:HyperLink>
                    </div>

                    <div class="btn-box">
                        <asp:Button ID="btnlogin" runat="server" Text="Login " 
                            CssClass="btn btn-success rounded-pill pl-4 pl-4 text-white" 
                            onclick="btnlogin_Click"></asp:Button>
                         <span class="pl-3 text-info">New User? <asp:LinkButton ID="LinkButton1" runat="server" href="registration.aspx" class="badge badge-info">Register Here..</asp:LinkButton></span>

                    </div>
                    
                </div>
            </div>
        </div>
    </div>

</section>
</asp:Content>

