<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="user_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    <div align="center">
    <h2>Your Cart:-</h2><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/user/menu1.aspx" >Continue Shopping</asp:HyperLink><br />
    <br />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#F1F2F3" BorderColor="Teal" BorderWidth="5px" 
        EmptyDataText="<center>No Product Available in Shopping Cart</center>" Font-Bold="True" 
        Height="200px" ShowFooter="True" Width="1500px" 
        onrowdeleting="GridView1_RowDeleting" >
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="Sr No." >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="pid" HeaderText="Product Id" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="pimage" HeaderText="Product Image" >
            <ControlStyle Height="170px" Width="170px" />
             <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:BoundField DataField="pname" HeaderText="Product Name" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="pprice" HeaderText="Price" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="pquantity" HeaderText="Quantity(Kg/Liter)" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ptotalprice" HeaderText="Total" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:CommandField DeleteText="<center>Remove</center>" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="Teal" ForeColor="White" />
        <HeaderStyle BackColor="Teal" ForeColor="White" />
    </asp:GridView>
    <br />
        <div>
        <asp:Button ID="Button1" runat="server" Text="Continue" class="baby" onclick="Button1_Click" />
        </div><br />
    </div>
</asp:Content>

