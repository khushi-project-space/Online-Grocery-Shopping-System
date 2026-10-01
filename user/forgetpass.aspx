<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="forgetpass.aspx.cs" Inherits="user_forgetpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>

.bt:hover
{
    background-color:#ffc107;
  /* margin-bottom:10px;*/
    }
table
{
     border-radius:7px;
     margin-top:20px;
     
    }
  td
  {
      margin:10px;
      padding:6px;
      }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><table style="margin-bottom:50px; background-color:Silver; ">
<br />
        
         <tr>
            <td colspan="2">
                <center><h2>Forget Password</h2></center><br />
                <center><asp:Label ID="Label4" runat="server"></asp:Label></center> <br />
            </td>
        </tr>

<tr>
        <td>
    
            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
       </td>

       <td>
            <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Email is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Please enter valid email" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter User Email" ToolTip="Email"></asp:TextBox><br />
       </td> 
</tr>

<tr>
    <td colspan="2">
       
             <asp:Button ID="Button1" class="bt" runat="server" Text="Continue" onclick="Button1_Click"  BorderColor="White" BorderWidth="2px" Font-Size="Large" 
                            ForeColor="White" Height="44px" Width="500px"  />
   </td>

</tr>
  
<tr>
<asp:Panel ID="Panel1" runat="server">
        <td>
                

                    <asp:Label ID="Label2" runat="server" Text=" New Password"></asp:Label>
        </td>

        <td>
            <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtpass" ErrorMessage="Password is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revpass1" runat="server" ErrorMessage="Password must be at least 8 characters long." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^.{8,}$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="revpass2" runat="server" ErrorMessage="Password must contain at least one uppercase letter." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*[A-Z]).*$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="revpass3" runat="server" ErrorMessage="Password must contain at least one lowercase letter." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="revpass4" runat="server" ErrorMessage="Password must contain at least one digit." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*\d).*$"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="revpass5" runat="server" ErrorMessage="Password must contain at least one special character." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*[@$!%*?&]).*$"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox><br />
        </td>
  
  </tr>

<tr>
    <td>
      <asp:Label ID="Label3" runat="server" Text="Re-Enter Password"></asp:Label>
   </td>

      <td>
            <asp:RequiredFieldValidator ID="rfvrepass" runat="server" ControlToValidate="txtrepass" ErrorMessage="Re-enter password" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvpass" runat="server" ErrorMessage="Please re-enter valid password" ControlToCompare="txtpass" ControlToValidate="txtrepass" ForeColor="Red" SetFocusOnError="True"  Display="Dynamic"></asp:CompareValidator>
            <asp:TextBox ID="txtrepass" runat="server" CssClass="form-control" placeholder="Re-enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox><br />
     </td>
 </tr>

  <tr>
        <td colspan="2">
     
                 <asp:Button ID="Button2" runat="server" class="bt" Text="Submit" onclick="Button2_Click"  BorderColor="White" BorderWidth="2px" Font-Size="Large" 
                            ForeColor="White" Height="44px" Width="500px" />
            <asp:Button ID="Button3" runat="server" Text="Submit" BorderColor="White" BorderWidth="2px" Font-Size="Large" 
                            ForeColor="White" Height="44px" Width="500px" onclick="Button3_Click" />
      </td> 
                
  </tr>
 </asp:Panel>  
 </table></center>

</asp:Content>

