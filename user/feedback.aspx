<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="user_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<style>
.feed
{
    height:400px;
    width:425px;
}
.f1
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
                  <img src="../temp/images/product/Feedbackerr.gif" class="feed" />
                   <%-- <img src="../temp/images/product/Feedbackgif.gif" class="feed" />--%>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form_container">
                 <h1 class="f1">Feeedback</h1><br />
                    <div>
                         <asp:RequiredFieldValidator ID="rfvusername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtfnm"  Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtfnm" runat="server" CssClass="form-control" placeholder="Enter Username" ReadOnly="True"></asp:TextBox>
                    </div>

                    <div>
                        <asp:RequiredFieldValidator ID="rfvpasssword" runat="server" ErrorMessage="Feedback is required" ControlToValidate="txtfeed"  Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtfeed" runat="server" CssClass="form-control" placeholder="Enter Feedback"></asp:TextBox>
                       
                    </div>

                    <div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Please select rating..." 
                            ControlToValidate="RadioButtonList1" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    Rating:
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="23px" 
                            RepeatDirection="Horizontal" Width="281px">
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>Very Good</asp:ListItem>
                            <asp:ListItem>Average</asp:ListItem>
                        </asp:RadioButtonList>
                       
                    </div>

                    <div class="btn-box">
                        <asp:Button ID="btnlogin" runat="server"  Text="Submit " 
                            CssClass="btn btn-success rounded-pill pl-4 pl-4 text-white" 
                            onclick="btnlogin_Click"></asp:Button><br />
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                     
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


</asp:Content>

