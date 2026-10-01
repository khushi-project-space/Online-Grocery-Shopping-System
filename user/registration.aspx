<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="user_registration" %>

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
    <style>
    .im1
    {
        height:40px;
        width:40px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section class="book_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <div class="align-self-end">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
            
            <asp:Label ID="Label2" runat="server" Text="<h2>User Registration</h2>"></asp:Label><br />
            <asp:Label ID="Label6" runat="server"></asp:Label>
             <asp:Label ID="Label5" runat="server"></asp:Label>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form_container">
                   
                    <div>
                        <asp:RequiredFieldValidator ID="rfvunm" runat="server" ControlToValidate="txtunm" ErrorMessage="User name is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                        <asp:TextBox ID="txtunm" runat="server" CssClass="form-control" placeholder="Enter User Name" ToolTip="Username"></asp:TextBox>
                        
                    </div>

                    <div>
                        <asp:RequiredFieldValidator ID="rfvfname" runat="server" ErrorMessage="First name is required" ControlToValidate="txtfname" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revfname" runat="server" ErrorMessage="First name must be in character only" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtfname"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtfname" runat="server" CssClass="form-control" placeholder="Enter First Name" ToolTip="First Name"></asp:TextBox>
                        
                    </div>

                    <div>
                        <asp:RequiredFieldValidator ID="rfvmname" runat="server" ErrorMessage="Middle name is required" ControlToValidate="txtmname" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revmname" runat="server" ErrorMessage="Middle name must be in character only" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtmname"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtmname" runat="server" CssClass="form-control" placeholder="Enter Middle Name" ToolTip="Middel Name"></asp:TextBox>
                        
                    </div>

                    <div>
                         <asp:RequiredFieldValidator ID="rfvlname" runat="server" ErrorMessage="Last name is required" ControlToValidate="txtlname" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revlname" runat="server" ErrorMessage="Last name must be in character only" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtlname"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtlname" runat="server" CssClass="form-control" placeholder="Enter Last Name" ToolTip="Middel Name"></asp:TextBox>
                       
                    </div>

                    <div>
                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Enter valid address" ControlToValidate="txtaddresss" 
                            ForeColor="Red"></asp:RegularExpressionValidator>--%>
                         <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddresss" ErrorMessage="Address is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtaddresss" runat="server" CssClass="form-control" placeholder="Enter Address" ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                       
                    </div>

                </div>
            </div>

             <div class="col-md-6">
                <div class="form_container">
                     <div><asp:Label ID="Label7" runat="server" Text="City:"></asp:Label>&nbsp;
                     <asp:DropDownList ID="DropDownList1" runat="server"  Height="50px" Width="510px">
                         <asp:ListItem>Anand</asp:ListItem>
                         <asp:ListItem>Nadiad</asp:ListItem>
                         <asp:ListItem>Borshad</asp:ListItem>
                         </asp:DropDownList>
                     </div><br />

                     <div>
                         <asp:RequiredFieldValidator ID="rfvno" runat="server" ControlToValidate="txtno" ErrorMessage="Mobile number is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revno" runat="server" ErrorMessage="Mobile number must 10 digits" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtno" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtno" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" ToolTip="Mobile Number"></asp:TextBox>
                       
                     </div>

                     <div>
                         <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Email is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Please enter valid email" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter User Email" ToolTip="Email"></asp:TextBox>
                       
                     </div>

                     <div>
                         <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtpass" ErrorMessage="Password is Required" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="revpass1" runat="server" ErrorMessage="Password must be at least 8 characters long." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^.{8,}$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass2" runat="server" ErrorMessage="Password must contain at least one uppercase letter." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*[A-Z]).*$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass3" runat="server" ErrorMessage="Password must contain at least one lowercase letter." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass4" runat="server" ErrorMessage="Password must contain at least one digit." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*\d).*$"></asp:RegularExpressionValidator>
                         <asp:RegularExpressionValidator ID="revpass5" runat="server" ErrorMessage="Password must contain at least one special character." Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ControlToValidate="txtpass" ValidationExpression="^(?=.*[@$!%*?&]).*$"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>
                    </div>

                    <div>
                         <asp:RequiredFieldValidator ID="rfvrepass" runat="server" ControlToValidate="txtrepass" ErrorMessage="Re-enter password" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvpass" runat="server" ErrorMessage="Please re-enter valid password" ControlToCompare="txtpass" ControlToValidate="txtrepass" ForeColor="Red" SetFocusOnError="True"  Display="Dynamic"></asp:CompareValidator>
                        <asp:TextBox ID="txtrepass" runat="server" CssClass="form-control" placeholder="Re-enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </div>

                    <div>
                     <asp:FileUpload ID="FileUpload1" runat="server" 
                            ErrorMessage="Image is required"  ForeColor="Red" Display="Dynamic" 
                            OnChange="ImagePreview(this)" onload="FileUpload1_Load" />
                     <asp:Image ID="Image1" runat="server" class="im1" 
                            ImageUrl="~/assets/images/auth/adminlogo.jpg"/>
                     <asp:Label ID="Label4" runat="server"></asp:Label>
                    </div>

                   
                </div>
            </div>

            <div class="row pl-4">
                <div class="btn-box">
                    <asp:Button ID="btnregister" runat="server" Text="Register" 
                        CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" 
                        onclick="btnregister_Click"></asp:Button>
                    <asp:Label ID="alreadyreg" runat="server" Text="Already registered? <a href='login.aspx' class='badge badge-info'>Login here..</a>" CssClass="pl-3 text-black-100"></asp:Label>
                </div>
            </div>
           
        </div>
    </div>
</section>
</asp:Content>

