<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="usermanage.aspx.cs" Inherits="admin_usermanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.form-group
{
    margin-bottom:15px;
    margin:15px;
    }
.data1
{
    margin-left:150px;
    text-align:center;
   
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <center><h2>User Details</h2></center>
</div><br />
    <div class="form-group">
     <asp:GridView ID="GridView1" class="data1" runat="server" 
         AutoGenerateColumns="False" DataKeyNames="unm" DataSourceID="SqlDataSource1">
         <Columns>
             <asp:CommandField ShowDeleteButton="True" />
             <asp:BoundField DataField="uimage" HeaderText="uimage" 
                 SortExpression="uimage" />
             <asp:BoundField DataField="unm" HeaderText="unm" ReadOnly="True" 
                 SortExpression="unm" />
             <asp:BoundField DataField="fnm" HeaderText="fnm" SortExpression="fnm" />
             <asp:BoundField DataField="mnm" HeaderText="mnm" SortExpression="mnm" />
             <asp:BoundField DataField="lnm" HeaderText="lnm" SortExpression="lnm" />
             <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
             <asp:BoundField DataField="address" HeaderText="address" 
                 SortExpression="address" />
             <asp:BoundField DataField="mno" HeaderText="mno" SortExpression="mno" />
             <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
         </Columns>
         <HeaderStyle BackColor="teal" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F1F2F3" />
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [User_info] WHERE [unm] = @unm" 
         InsertCommand="INSERT INTO [User_info] ([uimage], [unm], [fnm], [mnm], [lnm], [city], [address], [mno], [email]) VALUES (@uimage, @unm, @fnm, @mnm, @lnm, @city, @address, @mno, @email)" 
         SelectCommand="SELECT [uimage], [unm], [fnm], [mnm], [lnm], [city], [address], [mno], [email] FROM [User_info]" 
         UpdateCommand="UPDATE [User_info] SET [uimage] = @uimage, [fnm] = @fnm, [mnm] = @mnm, [lnm] = @lnm, [city] = @city, [address] = @address, [mno] = @mno, [email] = @email WHERE [unm] = @unm">
         <DeleteParameters>
             <asp:Parameter Name="unm" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="uimage" Type="String" />
             <asp:Parameter Name="unm" Type="String" />
             <asp:Parameter Name="fnm" Type="String" />
             <asp:Parameter Name="mnm" Type="String" />
             <asp:Parameter Name="lnm" Type="String" />
             <asp:Parameter Name="city" Type="String" />
             <asp:Parameter Name="address" Type="String" />
             <asp:Parameter Name="mno" Type="Decimal" />
             <asp:Parameter Name="email" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="uimage" Type="String" />
             <asp:Parameter Name="fnm" Type="String" />
             <asp:Parameter Name="mnm" Type="String" />
             <asp:Parameter Name="lnm" Type="String" />
             <asp:Parameter Name="city" Type="String" />
             <asp:Parameter Name="address" Type="String" />
             <asp:Parameter Name="mno" Type="Decimal" />
             <asp:Parameter Name="email" Type="String" />
             <asp:Parameter Name="unm" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>
 </div>
</asp:Content>

