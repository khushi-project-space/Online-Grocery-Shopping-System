<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="billinginfo.aspx.cs" Inherits="admin_billinginfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="display:flex;align-items:center;justify-content:center;flex-direction:column;">
<br /><br />
    <asp:Button ID="Button1" runat="server" Text="Click here to download invoice" 
    onclick="Button1_Click" BackColor="Teal" Width="500px" ForeColor="White"/>
   <br /><br />
    <asp:Panel ID="Panel1" runat="server">
    <table border="2">
        <tr>
            <td style="text-align:center;">
                <h2>Invoice</h2>
            </td>
        </tr>
        <tr>
            <td>
                Orderid:
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br /><br />
                Order date:
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                Sold to
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            Buyer address:<br />
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            Seller Name:<br />
                            Admin
                        </td>
                    </tr>
                </table>
                </td>
        </tr>
        <tr>
            <td>
                
               
                <asp:GridView ID="GridView1" runat="server" Width="1000px" AutoGenerateColumns="False">
                  <Columns>
                       
                        <asp:BoundField DataField="productid" HeaderText="Product Id" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="productname" HeaderText="Product Name">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="Quantity">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="Price">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="totalprice" HeaderText="Total price">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
         </tr>
         <tr>
            <td align=right>
            Grand total:
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>

            </td>
        </tr>
        <tr>
            <td align=center>
                This is invoice
            </td>
        </tr>
    </table>
    </asp:Panel>
    </div>
    <br /><br />
</asp:Content>

