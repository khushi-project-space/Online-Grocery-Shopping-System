<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="placeorder.aspx.cs" Inherits="user_placeorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
  <center> <h1 class="f4">Payment Process</h1><br /><br /></center>
   <center><table  style="margin-bottom:50px">
    <tr>
       <td >
  
            <asp:Panel ID="Panel3" runat="server" Height="500px" Width="500px">
 
            <br />
       
       <center>
     
        <center><asp:Image ID="Image1" runat="server"  img src="../temp/images/Untitled%20design%20(3).gif" Height="450px" Width="390px"/></center>
    </asp:Panel>   
    
    </td>

        <td> 
     


<asp:Panel ID="Panel2" runat="server">
  <div class="form">

        <div class="f1">

            <div class="f2">
                <h2>Cash Details</h2>
            </div>

        
        <div class="f2">
            <asp:Label ID="Label1" runat="server" Text="User Name" Font-Size="Large" ForeColor="Black"></asp:Label>
        </div>
        <div class="f2">
            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" BorderColor="Black" placeholder="User Address" BorderWidth="2px"  Font-Size="Medium" Height="50px" Width="500px" TextMode="MultiLine"></asp:TextBox>
        </div><br />


        <div class="f2">
            <asp:Label ID="Label7" runat="server" Text="Payment Id" Font-Size="Large" ForeColor="Black"></asp:Label>
        </div>
        <div class="f2">
            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" BorderColor="Black" placeholder="First Name" BorderWidth="2px"  Font-Size="Medium" Height="44px" Width="500px"></asp:TextBox>
        </div><br />

        <div class="f2">
            <asp:Label ID="Label8" runat="server" Text="User Address" Font-Size="Large" ForeColor="Black"></asp:Label>
        </div>
        <div class="f2">
            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" BorderColor="Black" placeholder="User Address" BorderWidth="2px"  Font-Size="Medium" Height="50px" Width="500px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="First name is Required" ForeColor="Red" ControlToValidate="Textbox8" Text="*"></asp:RequiredFieldValidator>
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationExpression="^[a-zA-Z0-9\s,.'-]{5,10}$" ErrorMessage="Address Is Required"  ForeColor="Red" ControlToValidate="Textbox8" Text="*"></asp:RegularExpressionValidator>--%>
        </div><br />

        
                
                <asp:Button ID="Button2" runat="server" Text="Place Order" BackColor="Teal" class="baby"
                            BorderColor="White" BorderWidth="2px" Font-Size="Large" 
                            ForeColor="White" Height="44px" Width="500px" 
                    onclick="Button2_Click"  />
                        
        
   </div>
   </div>
   </asp:Panel>

    </td>
    </tr>
    </table>

    </center> 
</asp:Content>

