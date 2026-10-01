<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
    .data1
{
   /* margin-left:900px;
    text-align:center;
    margin-top:30px;
    margin-bottom:30px;*/
    }
  .txt
  {
      margin-left:700px;
        margin-top:30px;
        font-size:50px;
      }
   .tct
   {
     margin-left:100px;
       }   
      .d1
      {
          margin-left:20px;
          }
     .form
     {
         display:flex;
         justify-content:center;
         align-items:center;
         margin:15px;
         }     
    .ff1
    {
        margin-left:100px;
        
        margin-bottom:20px;
        padding:20px;
        }
   .img1
   {
       margin:15px;
       }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2 class="txt">User Profile</h2>
<div class="form">

<div class="ff1">
    
    <asp:Label ID="Label2" runat="server" Text="Label" class="tct"></asp:Label>
    <asp:DetailsView ID="DetailsView2" class="d1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" 
        GridLines="Horizontal" Height="16px" Width="30px">
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:ImageField DataImageUrlField="uimage" FooterText="User Profile"  ItemStyle-Height="300px" 
                ControlStyle-Width="300px" 
                NullImageUrl="~/assets/images/auth/adminlogo.jpg">
                <ControlStyle />
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [uimage] FROM [User_info] WHERE ([unm] = @unm)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label2" Name="unm" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
 

</div>

<div class="ff1">
    <asp:DetailsView ID="DetailsView1" class="data1" runat="server" Height="146px" Width="451px" 
        AutoGenerateRows="False" DataKeyNames="unm" DataSourceID="SqlDataSource1" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="unm" HeaderText="User Name" SortExpression="unm" 
                ReadOnly="True" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="fnm" HeaderText="fnm" SortExpression="fnm" />
            <asp:BoundField DataField="mnm" HeaderText="mnm" SortExpression="mnm" />
            <asp:BoundField DataField="lnm" HeaderText="lnm" SortExpression="lnm" />
            <asp:BoundField DataField="city" HeaderText="city" 
                SortExpression="city" />
            <asp:BoundField DataField="address" HeaderText="address" 
                SortExpression="address" />
            <asp:BoundField DataField="mno" HeaderText="mno" SortExpression="mno" />
            <asp:BoundField DataField="email" HeaderText="email" 
                SortExpression="email" />
            
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [User_info] WHERE [unm] = @unm" 
        InsertCommand="INSERT INTO [User_info] ([uimage], [unm], [fnm], [mnm], [lnm], [city], [address], [mno], [email], [password]) VALUES (@uimage, @unm, @fnm, @mnm, @lnm, @city, @address, @mno, @email, @password)" 
        SelectCommand="SELECT * FROM [User_info] WHERE ([unm] = @unm)" 
        UpdateCommand="UPDATE [User_info] SET [uimage] = @uimage, [fnm] = @fnm, [mnm] = @mnm, [lnm] = @lnm, [city] = @city, [address] = @address, [mno] = @mno, [email] = @email, [password] = @password WHERE [unm] = @unm">
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
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Label2" Name="unm" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="uimage" Type="String" />
            <asp:Parameter Name="fnm" Type="String" />
            <asp:Parameter Name="mnm" Type="String" />
            <asp:Parameter Name="lnm" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="mno" Type="Decimal" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="unm" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
   </div>
</div>
    </asp:Content>

