<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="admin_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.form-group
{
    margin-bottom:15px;
    margin:15px;
    margin-left:240px;
    }
.data1
{
    margin-left:150px;
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
    <center><h2>Feedback Report</h2></center>
</div>
<br />
<br />
    <div class="form-group">
    <%--<div class="user">
            <h2>User Report</h2>
    </div>--%>
    <asp:GridView ID="GridView1" class="data1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="unm" DataSourceID="SqlDataSource1" Height="145px" Width="518px" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="unm" HeaderText="Username" ReadOnly="True" 
                SortExpression="unm"  >

            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />

            </asp:BoundField>
            <asp:BoundField DataField="feddback" HeaderText="Feddback" 
                SortExpression="feddback" />
            <asp:BoundField DataField="rating" HeaderText="Rating" 
                SortExpression="rating" />
        </Columns>
        <HeaderStyle BackColor="teal" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F1F2F3" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Feedback_info] WHERE [unm] = @unm" 
        InsertCommand="INSERT INTO [Feedback_info] ([unm], [feddback], [rating]) VALUES (@unm, @feddback, @rating)" 
        SelectCommand="SELECT * FROM [Feedback_info]" 
        UpdateCommand="UPDATE [Feedback_info] SET [feddback] = @feddback, [rating] = @rating WHERE [unm] = @unm">
        <DeleteParameters>
            <asp:Parameter Name="unm" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="unm" Type="String" />
            <asp:Parameter Name="feddback" Type="String" />
            <asp:Parameter Name="rating" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="feddback" Type="String" />
            <asp:Parameter Name="rating" Type="String" />
            <asp:Parameter Name="unm" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

