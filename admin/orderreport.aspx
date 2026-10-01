<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="orderreport.aspx.cs" Inherits="admin_orderreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.form-group
{
    margin-bottom:15px;
    margin:15px;
    margin-left:150px;
    }
.data1
{
    margin-left:10px;
    text-align:center;
  
    }
    /*.user
    {
        text-align:center;
        }*/
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <center><h2>Order Report</h2></center>
</div><br />
    <div class="form-group">
    <asp:GridView ID="GridView1" class="" runat="server" AutoGenerateColumns="False" 
         DataKeyNames="orderid" DataSourceID="SqlDataSource1" Height="152px" 
         Width="900px" onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="orderid" HeaderText="orderid" ReadOnly="True" 
                SortExpression="orderid" />
            <asp:BoundField DataField="sno" HeaderText="sno" SortExpression="sno" />
            <asp:BoundField DataField="productid" HeaderText="productid" 
                SortExpression="productid" />
            <asp:BoundField DataField="productname" HeaderText="productname" 
                SortExpression="productname" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="quantity" HeaderText="quantity" 
                SortExpression="quantity" />
            <asp:BoundField DataField="orderdate" HeaderText="orderdate" 
                SortExpression="orderdate" />
        </Columns>
         <HeaderStyle BackColor="teal" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F1F2F3" />
    </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [OrderDetails] WHERE [orderid] = @orderid" 
         InsertCommand="INSERT INTO [OrderDetails] ([orderid], [sno], [productid], [productname], [price], [quantity], [orderdate]) VALUES (@orderid, @sno, @productid, @productname, @price, @quantity, @orderdate)" 
         SelectCommand="SELECT * FROM [OrderDetails]" 
         UpdateCommand="UPDATE [OrderDetails] SET [sno] = @sno, [productid] = @productid, [productname] = @productname, [price] = @price, [quantity] = @quantity, [orderdate] = @orderdate WHERE [orderid] = @orderid">
         <DeleteParameters>
             <asp:Parameter Name="orderid" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="orderid" Type="String" />
             <asp:Parameter Name="sno" Type="Int32" />
             <asp:Parameter Name="productid" Type="Int32" />
             <asp:Parameter Name="productname" Type="String" />
             <asp:Parameter Name="price" Type="Int32" />
             <asp:Parameter Name="quantity" Type="Int32" />
             <asp:Parameter Name="orderdate" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="sno" Type="Int32" />
             <asp:Parameter Name="productid" Type="Int32" />
             <asp:Parameter Name="productname" Type="String" />
             <asp:Parameter Name="price" Type="Int32" />
             <asp:Parameter Name="quantity" Type="Int32" />
             <asp:Parameter Name="orderdate" Type="String" />
             <asp:Parameter Name="orderid" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>
</div>
</asp:Content>

