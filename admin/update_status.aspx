<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="update_status.aspx.cs" Inherits="admin_update_status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
 .form-groupp {
      margin-bottom: 15px;
      margin:15px; 
    }
  .btn
  {
      background-color:#4CAF50;
      color:White;
      }
    
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h2>Update Status</h2></center>
<br />
    <table border=2>
    
    <tr>
        <td style="width:100px; color:white; background-color:teal">User Name</td>
        <td style="width:310px; color:white;  background-color:teal">Order ID</td>
         <td style="width:100px; color:white;  background-color:teal">Sno    </td>
        <td style="width:150px; color:white;  background-color:teal">Product ID</td>
        <td style="width:98px; color:white;  background-color:teal">Product Name</td>
        <td style="width:100px; color:white;  background-color:teal">Price</td>
        <td style="width:100px; color:white;  background-color:teal">Quantity</td>
        <td style="width:100px; color:white;  background-color:teal">Order Date</td>
        <td style="width:100px; color:white;  background-color:teal">Delivery status</td>
        <td style="width:100px; color:white;  background-color:teal">Select option</td>
        <%--<td style="width:100px; color:white;  background-color:teal">View Billing</td>--%>
    </tr>

</table>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
       OnItemCommand="DataList1_ItemCommand"  >
        <ItemTemplate>
             <table border=2 width="100%" >
                <tr>
                    <td style="width:100px">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("unm") %>'></asp:Label>
                    </td>
                    <td style="width:300px">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("orderid") %>'></asp:Label>
                    </td>
                    <td style="width:100px">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("sno") %>'></asp:Label>
                    </td>
                    <td style="width:150px">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                    </td>
                    <td style="width:100px">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                  </td>
                    <td style="width:100px">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                    <td style="width:100px">
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                    </td>
                    <td style="width:100px">
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("orderdate") %>'></asp:Label>
                    </td>
                    <td style="width:100px">
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                    </td>
                    <td style="width:100px" >
                         <asp:Button ID="Button1" runat="server" Text="select"  CommandArgument='<%# Eval("orderid") %>' CommandName="select" />  
                    </td>

                   <%-- <td>--%>
                     <%--<td style="width:100px" >
                        <asp:Button ID="btnBill" runat="server" Text="View Bill" CommandArgument='<%# Eval("orderid") %>'  CommandName="select1" OnClick="btnBill_Click" />
                    </td>--%>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [OrderDetails]"></asp:SqlDataSource><br />

        <left>
          <table border=2 width="50%">
                <tr>
                        <td style="color:white; background-color:teal">User Name</td>
                        <td style="color:white; background-color:teal">Order Id</td>
                        <td style="color:white; background-color:teal">Delivery status</td>
                </tr> 
                <tr>
                        <td> <asp:Label ID="Label10" runat="server" ></asp:Label></td>
                        <td> <asp:Label ID="Label11" runat="server" ></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Delivered</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                </tr>
        </table><br />
     </left>   
        <div class="form-groupp">
        <asp:Button ID="Button2" class="btn" runat="server"  Text="update" 
        onclick="Button2_Click"  />
        </div>

</asp:Content>

