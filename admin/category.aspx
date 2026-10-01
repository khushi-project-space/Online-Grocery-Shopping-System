<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true"
    CodeFile="category.aspx.cs" Inherits="admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
    body {
      font-family: sans-serif;
    }
    .data1
{
    margin-left:300px;
    text-align:center;
   padding-right:10px;
    }
   
    .form-container {
      width: 400px;
      margin: 10px;
      padding: 20px;
      padding-right:20px;
      display:flex;
     
    }
    .form-groupp {
      margin-bottom: 15px;
      margin:15px;
    }
    .form-label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    .form-input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .form-button {
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      background-color: #4CAF50;
      color: white;
      cursor: pointer;
    }
    .form-button:hover {
      background-color: #45a049;
    }
   
  </style>
 <form id="productForm" method="post">
 <div>
    <center><h2>Category Details</h2></center>
 </div>
  <div class="form-container">
   
    <div class="from-groupp">
     <h2> Add Category </h2><br />
     
      <div class="form-group">
        <label class="form-label" for="categoaryName">Categoary Name:</label>
        <asp:TextBox ID="categaoryName" runat="server" CssClass="form-input" Placeholder="Enter Categaory Name" Width="350"/>
         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="categaoryName" ErrorMessage="Categoary Name is Required"></asp:RequiredFieldValidator><br />
          <asp:RegularExpressionValidator ID="categoryRegularExpressionValidator1" runat="server" ErrorMessage="Only character required" ControlToValidate="categaoryName" ForeColor="Red"  ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>--%>
      </div>

      <div class="form-group">
        <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="form-button" 
              onclick="submitButton_Click" />
        <asp:Button ID="clear" runat="server" Text="Clear" CssClass="form-button" 
              onclick="clear_Click"/><br /><br />
          <asp:Label ID="Label1" runat="server"></asp:Label>
      </div>
 </div>
 <div class="from-groupp">    
         <div>
             <asp:GridView ID="GridView1" runat="server" class="data1" AutoGenerateColumns="False" 
                 DataKeyNames="P_cat" DataSourceID="SqlDataSource1" Height="146px" 
                 Width="234px">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="P_cat" HeaderText=" Category Id" ReadOnly="True" 
                         SortExpression="P_cat" />
                     <asp:BoundField DataField="cat_nm" HeaderText="Name" 
                         SortExpression="cat_nm" />
                 </Columns>
                  <HeaderStyle BackColor="teal" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F1F2F3" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 DeleteCommand="DELETE FROM [Category_info] WHERE [P_cat] = @P_cat" 
                 InsertCommand="INSERT INTO [Category_info] ([P_cat], [cat_nm]) VALUES (@P_cat, @cat_nm)" 
                 SelectCommand="SELECT * FROM [Category_info]" 
                 UpdateCommand="UPDATE [Category_info] SET [cat_nm] = @cat_nm WHERE [P_cat] = @P_cat">
                 <DeleteParameters>
                     <asp:Parameter Name="P_cat" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="P_cat" Type="String" />
                     <asp:Parameter Name="cat_nm" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="cat_nm" Type="String" />
                     <asp:Parameter Name="P_cat" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
</div>
</div>
</form>

</asp:Content>
