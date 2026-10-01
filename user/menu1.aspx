<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="menu1.aspx.cs" Inherits="user_menu1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
 .img
{
        background-color:#f1f2f3;
        border-radius:6px;
}
.d1
{
        margin:70px;
}
.d2
{
    margin-left:150px;
   
}
.txt
{
   
    height: 50px;
    border-radius: 9px;
    background-color:#f1f2f3;
}
    
.l1
{
    margin-right:100px;
    margin-top:10px;
}
tr
{
   margin:50px;
        
}
table
{
   margin:30px;
        
}
td
{
   border-radius:9px;
}
        
.main
{
      display:flex;
      justify-content:center;
      align-items:center;
}
.img1
{
     height: 50px;
    border-radius: 9px;
    background-color:#f1f2f3;
    Width="50px"
}
.td:hover
{
    
   transform:scale(1.1);
   background-color: teal; /* Change to any color you prefer */
   transition: transform 0.6s ease, background-color 0.50s ease; /* Smooth transition */
}
.txt:hover
{
     transform:scale(1.01); 
}    
.img1:hover
{
    transform:scale(1.1);
}

.add:hover
{
    transform:scale(1.1);
}   
     
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="heading_container heading_center"><br />
   
    <h2 >Our Menu</h2></div><br />

<div class="main">

   <%-- <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="cat_nm" DataValueField="cat_nm">
    </asp:DropDownList>--%>
    <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [cat_nm] FROM [Category_info]"></asp:SqlDataSource>--%>
    
    <div class="f1">
    <asp:TextBox ID="TextBox2" class="txt" runat="server"  placeholder="Search" Width="900px"></asp:TextBox>
    </div>
    &nbsp;
    <div class="f1">
    <asp:ImageButton ID="ImageButton3" runat="server" class="img1"  
        ImageUrl="../temp/images/search-icon.png" onclick="ImageButton3_Click"   />
    </div>
</div>
       <asp:DataList ID="DataList1" runat="server" DataKeyField="Pro_id" 
        DataSourceID="SqlDataSource1" onitemcommand="DataList1_ItemCommand1" 
        RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
        
           <table BorderWidth="2px"  >
              
               <tr>
                    <td class="td">
                        <asp:Image ID="Image1" runat="server" class="img"
                            Height="300px" Width="300px" ImageUrl='<%# Eval("P_img") %>'/>
                    </td>
               </tr>
             
               <caption>
                   <br />
                   <tr>
                       <td style="text-align:center; background-color:teal">
                           <br />
                           <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" 
                               Font-Size="Larger" ForeColor="white" Text='<%# Eval("Pro_nm") %>'></asp:Label>
                           <br />
                           <br />
                           <asp:Label ID="Label2" runat="server" Font-Names="Arial" ForeColor="white" 
                               style="text-align:center" Text="Price Rs."></asp:Label>
                           <asp:Label ID="Label3" runat="server" Font-Names="Arial" ForeColor="white" 
                               style="text-align:center" Text='<%# Eval("Price") %>'></asp:Label>
                           <br />
                           <%-- <asp:Label ID="Label4" ForeColor="white" runat="server" Text='<%# Eval("Des") %>'  
                            Font-Names="Arial"></asp:Label><br />--%>
                           <asp:Label ID="Label5" runat="server" ForeColor="white" Text="Quntity"></asp:Label>
                           
                        
                           <asp:TextBox ID="TextBox1" runat="server" Width="50px" Text="1">&nbsp;</asp:TextBox><asp:Label
                               ID="Label4" runat="server" Text="(KG./LTR)" ForeColor="White"></asp:Label><br />
                          <%-- <asp:TextBox ID="Textqut" runat="server"  Width="50px"></asp:TextBox><br />--%>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                               ErrorMessage="Enter quantity (1-10, e.g., 1, 2..)" ControlToValidate="TextBox1" 
                               ValidationExpression="^(10|[1-9])$" ForeColor="Red"></asp:RegularExpressionValidator>
                           <br />
                           <br />
                           <asp:ImageButton ID="ImageButton1" runat="server" 
                               CommandArgument='<%# Eval("Pro_id") %>' CommandName="AddtoCart" 
                               ImageUrl="../temp/images/product/cart3.jpg" class="add" Width="154px" />
                       </td>
                   </tr>
               </caption>
               
           </table>
           
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Pro_id], [Pro_nm], [Price],  [P_img] FROM [Item_info]">
    </asp:SqlDataSource>
    </asp:Content>

