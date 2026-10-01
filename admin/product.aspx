<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="admin_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function ImagePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
    body {
      font-family: sans-serif;
    }
 
.data1
{
    margin-left:10px;
    text-align:center;
   padding-right:10px;
    }
    
    .form-container {
      width: 400px;
      margin:10px;
      padding: 20px;
      padding-right:20px;
     display:flex;
     justfiy-content:center;
      

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


<body>
   <div>
    <center><h2>Product Details</h2></center>
   </div>

 
 <div class="form-container">
     <form id="productForm" method="post">
 
    <div class="form-grouppp" width:"70px">
    <h2> Add Product </h2><br />

          <div class="form-group">
              <asp:Label ID="Label3" runat="server" class="form-label" for="productName">Product Name:</asp:Label>
            <asp:TextBox ID="productName" runat="server" CssClass="form-input" 
                  Placeholder="Enter Product Name" Width="230"
                  > </asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="productNameValidator" runat="server"   ForeColor="Red" ControlToValidate="productName" ErrorMessage="Product Name is required" Display ="Dynamic" />
              <asp:RegularExpressionValidator ID="productRegularExpressionValidator1" runat="server" ErrorMessage="Only character required" ControlToValidate="productName" ForeColor="Red"  ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>--%>
          </div>

          <div class="form-group">
              <asp:Label ID="Label4" runat="server" class="form-label" for="productPrice">Product Price:</asp:Label>
            <asp:TextBox ID="productPrice" runat="server" CssClass="form-input" placeholder="Enter Product Price" Width="230" />
           <%-- <asp:RequiredFieldValidator ID="productPriceValidator" runat="server"   ForeColor="Red" ControlToValidate="productPrice" ErrorMessage="Product Price is required" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="productPriceRegexValidator" runat="server"  ForeColor="Red" ControlToValidate="productPrice" ErrorMessage="Invalid price format" ValidationExpression="^\d+(\.\d{1,2})?$" Display="Dynamic" />--%>
          </div>

          <div class="form-group">
         
              <asp:Label ID="Label5" runat="server"  class="form-label" for="productDes">Product Quntity:</asp:Label>
            <asp:TextBox ID="productqnt" runat="server" CssClass="form-input" placeholder="Enter Product Quntity" Width="230" />
           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ForeColor="Red" ControlToValidate="productqnt" ErrorMessage="Product Quntity is required" Display="Dynamic"  />  
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ForeColor="Red" ControlToValidate="productqnt" ErrorMessage="Invalid quantity format" ValidationExpression="^\d+(\.\d{1,2})?$" Display="Dynamic" />     --%>
          </div>

          <div class="form-group">
            <asp:Label ID="Label2" runat="server" class="form-label" for="productDes">Product Image:</asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" ErrorMessage="Product Image is required"  ForeColor="Red" Display="Dynamic" OnChange="ImagePreview(this)" />
            <asp:Image ID="Image1" runat="server" Height="37px" Width="46px" />
             <asp:Label ID="Label1" runat="server"></asp:Label>
         
          </div>

          <div class="form-group">
             
              <asp:Label ID="Label6" runat="server" class="form-label" for="productPrice">Category:</asp:Label>
              <asp:DropDownList ID="DropDownList1" runat="server" 
                  DataSourceID="SqlDataSource1" DataTextField="cat_nm" 
                  DataValueField="cat_nm" Width="121px">
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                  SelectCommand="SELECT [cat_nm] FROM [Category_info]"></asp:SqlDataSource>
              
          </div>


          <div class="form-group">
            <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="form-button" 
                  onclick="submitButton_Click" />
            <asp:Button ID="clear" runat="server" Text="Clear" CssClass="form-button" 
                  onclick="clear_Click"/><br /><br />
              <asp:Label ID="Label7" runat="server"></asp:Label>
          </div>
</div>


     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         DataKeyNames="Pro_id" DataSourceID="SqlDataSource2" Height="155px" 
         Width="243px">
         <Columns>
             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
             <asp:BoundField DataField="Pro_id" HeaderText="Product id" 
                 InsertVisible="False" ReadOnly="True" SortExpression="Pro_id" />
             <asp:BoundField DataField="Pro_nm" HeaderText="Product Name" 
                 SortExpression="Pro_nm" />
             <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
             <asp:BoundField DataField="Qty" HeaderText="Quntity" SortExpression="Qty" />
             <asp:BoundField DataField="P_img" HeaderText="Product Image" 
                 SortExpression="P_img" />
             <asp:BoundField DataField="cat_nm" HeaderText="category name" 
                 SortExpression="cat_nm" />
         </Columns>
         <HeaderStyle BackColor="teal" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#F1F2F3" Width="20px" />
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [Item_info] WHERE [Pro_id] = @Pro_id" 
         InsertCommand="INSERT INTO [Item_info] ([Pro_nm], [Price], [Qty], [P_img], [cat_nm]) VALUES (@Pro_nm, @Price, @Qty, @P_img, @cat_nm)" 
         SelectCommand="SELECT * FROM [Item_info]" 
         UpdateCommand="UPDATE [Item_info] SET [Pro_nm] = @Pro_nm, [Price] = @Price, [Qty] = @Qty, [P_img] = @P_img, [cat_nm] = @cat_nm WHERE [Pro_id] = @Pro_id">
         <DeleteParameters>
             <asp:Parameter Name="Pro_id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Pro_nm" Type="String" />
             <asp:Parameter Name="Price" Type="Decimal" />
             <asp:Parameter Name="Qty" Type="Int32" />
             <asp:Parameter Name="P_img" Type="String" />
             <asp:Parameter Name="cat_nm" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Pro_nm" Type="String" />
             <asp:Parameter Name="Price" Type="Decimal" />
             <asp:Parameter Name="Qty" Type="Int32" />
             <asp:Parameter Name="P_img" Type="String" />
             <asp:Parameter Name="cat_nm" Type="String" />
             <asp:Parameter Name="Pro_id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</div> 

</body>
</asp:Content>

