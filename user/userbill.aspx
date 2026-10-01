<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true" CodeFile="userbill.aspx.cs" Inherits="user_userbill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
        body {
            font-family: Arial, sans-serif;
        }

       .containerc {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
           
        }

        .section {
           width:400px;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            
             margin-left:10px; 
        }
     

        .section h2 {
            margin-bottom: 10px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
.delivery_img {
 
  margin-top:50px;
   margin-left:30px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h1><center>Order Delivery Information</center></h1><br />
    <div class="containerc">
        
    
        <div class="delivery_img">
          
           <img src="../assets/images/Delivery.gif" height="500px" width="400px"/>
       </div>
   
   <div class="p1"> 
        <div class="section">

            <h2>Customer Information</h2>
            <div>
                <label for="name">Name:</label>
                <%--<input type="text" id="name" class="input-field">--%>
                <asp:TextBox ID="cnm" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="contact-number">Contact Number:</label>
                <%--<input type="text" id="contact-number" class="input-field">--%>
                <asp:TextBox ID="cnum" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="email">Email:</label>
               <%-- <input type="email" id="email" class="input-field">--%>
                <asp:TextBox ID="cemail" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
        <%--</div>--%>
<%--
        <div class="section">--%>
           
            <h2>Payment method</h2>   
               <div>
                <label for="payment-id">Payment ID:</label>
                <%--<input type="text" id="payment-id" class="input-field">--%>
                <asp:TextBox ID="Textpid" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
           <div>
                <label for="payment-method">Payment Method:</label>
                <%--<input type="text" id="payment-method" class="input-field">--%>
                <asp:TextBox ID="TextBox11" runat="server" class="input-field" ReadOnly="True" Text="Cash"></asp:TextBox>
            </div>
            <div>
                <label for="delivery-status">Delivery Status:</label>
               <%-- <input type="text" id="delivery-status" class="input-field">--%>
                <asp:TextBox ID="ostatus" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
       </div>
</div>
<div class="p1">
        <div class="section">
         <h2>Order Details</h2>
            <div>
                <label for="order-number">Order Number:</label>
                <%--<input type="text" id="order-number" class="input-field">--%>
                <asp:TextBox ID="onm" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="order-date">Order Date:</label>
               <%-- <input type="date" id="order-date" class="input-field">--%>
                <asp:TextBox ID="odate" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="estimated-delivery-time">Estimated Delivery Time:</label>
               <%-- <input type="text" id="estimated-delivery-time" class="input-field">--%>
                <asp:TextBox ID="TextBox8" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="total-amount">Total Amount:</label>
                <%--<input type="text" id="total-amount" class="input-field">--%>
                <asp:TextBox ID="Texttotal" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>
       <%-- </div>--%>
        <%--<div class="section">--%>
         
             <h2>Delivery Address</h2>
            <div>
                <label for="address">Address:</label>
                <%--<input type="text" id="address" class="input-field">--%>
                <asp:TextBox ID="Textaddress" runat="server" class="input-field" 
                    ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="city"> City:</label>
                <%--<input type="text" id="city" class="input-field">--%>
                <asp:TextBox ID="ccity" runat="server" class="input-field" ReadOnly="True"></asp:TextBox>
            </div>

            <div>
                <asp:Button ID="Button1" class="baby" runat="server" onclick="Button1_Click" Text="Generate Bill" Width="200" /></button>
            </div>
        </div>
        </div>
   </div>
</asp:Content>

