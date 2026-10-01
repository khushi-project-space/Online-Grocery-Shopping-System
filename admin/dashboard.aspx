<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .panel {
            background-color: white;
            padding: 6px;
            border-radius: 8px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: background-color 0.3s;
            
        }

        .panel:hover {
           /* background-color: #4fd1c5;  Teal color */
            transform:scale(1.10);
           
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 16px;
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 16px;
        }

        @media (min-width: 640px) {
            .grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 768px) {
            .grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        .title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 32px;
        }

        .label {
            font-weight: 600;
            margin-bottom: 8px;
        }

        .label-bottom {
            font-weight: 600;
            margin-top: 8px;
        }
        
        .image-container {
            position: relative;
            display: inline-block;
           
          
            }

     .overlay-label {
    position: static;
    top: 90%;  /* Adjust vertical position */
    left: 50%; /* Adjust horizontal position */
    transform: translate(-50%, -50%);
    background: rgba(0, 0, 0, 0.6); /* Semi-transparent background */
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
    text-align: center;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
    <div class="container">
        <h1 class="title">Admin Dashboard</h1>
        <div class="grid">
          
            <div class="panel">
            <div class="image-container">
                    <asp:ImageButton ID="btnUsers" runat="server" Width="250px" Height="300px"  CssClass="image-button" onclick="btnUsers_Click" 
                        ImageUrl="~/admin/dashimg/ttotaluser1.gif"/><br />
            
                    <p><asp:Label ID="lblOverlay" runat="server"  CssClass="overlay-label"></asp:Label></p>
                </div>
            </div>

            <div class="panel">
                <div class="image-container">
                 <asp:ImageButton ID="ImageButton1" runat="server" Width="250px" Height="300px" CssClass="image-button"
                        onclick="ImageButton1_Click" ImageUrl="~/admin/dashimg/totalpro.gif" /> <br />
                         <p><asp:Label ID="Label2" runat="server" CssClass="overlay-label"></asp:Label></p>
                </div>
            </div>

            <div class="panel">
                <div class="image-container">
                
               <asp:ImageButton ID="ImageButton2" runat="server" Width="250px" Height="300px" CssClass="image-button" 
                        onclick="ImageButton2_Click" ImageUrl="~/admin/dashimg/totalcat.gif"/><br />
                        <p><asp:Label ID="Label3" runat="server" CssClass="overlay-label"></asp:Label></p>
               </div>
            </div>

            <div class="panel">
                 <div class="image-container">
             
                  
                     <asp:ImageButton ID="ImageButton3" runat="server" Width="250px" Height="300px" 
                         CssClass="image-button" onclick="ImageButton3_Click" 
                         ImageUrl="~/admin/dashimg/totalorder1.gif" /><br />
                  
                     <p><asp:Label ID="Label4" runat="server" CssClass="overlay-label"></asp:Label></p>
                   
                   </div>
            </div>

            <div class="panel">
                <div class="image-container">
                
               <asp:ImageButton ID="ImageButton4" runat="server" Width="250px" Height="300px" 
                        CssClass="image-button" onclick="ImageButton4_Click" 
                        ImageUrl="~/admin/dashimg/feedback1.gif" /><br />

                        <p><asp:Label ID="Label5" runat="server" Text="Label" CssClass="overlay-label"> </asp:Label></p>
           
               </div>
            </div>
        </div>
    </div>
</body>
</asp:Content>

