<%@ Page Title="" Language="C#" MasterPageFile="~/user/usermasterpage.master" AutoEventWireup="true"
    CodeFile="home.aspx.cs" Inherits="user_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- slider section -->
    <div class="hero_area">
        <div class="bg-box">
            <img src="../temp/images/m4.jpg">
        </div>
   <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                     Online Gorocery Shopping System
                    </h1>
                  <%--  <p>
                      Doloremque, itaque aperiam facilis rerum, commodi, temporibus sapiente ad mollitia laborum quam quisquam esse error unde. Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos nihil ducimus libero ipsam.
                    </p>--%>
                    <div class="btn-box">
                      <a href="menu1.aspx" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item ">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                     Online Gorocery Shopping System
                    </h1>
                 
                    <div class="btn-box">
                      <a href="menu1.aspx" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                     Online Gorocery Shopping System
                    </h1>
                 
                    <div class="btn-box">
                      <a href="menu1.aspx" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
          </ol>
        </div>
      </div>
    </div>
    </section>
    <!-- end slider section -->
    <!-- offer section -->
    <section class="offer_section layout_padding-bottom">
    <div class="offer_container">
      <div class="container ">
        <div class="row">
          <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
               <img src="../temp/images/call.jpg" alt=""/>
              </div>
              <div class="detail-box">
                <h3>
                 24/7 Support
                </h3>
                <h5>
                 <span> Get support all day</span> 
                </h5>
                </div>
            </div>
          </div>
          <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../temp/images/refund.jpg" ali=""  />
              </div>
             
              <div class="detail-box">
                <h3>
                  Refund
                </h3>
                <h5>
                  <span>Get refund within 3 days!</span>
                </h5>
                </div>
            </div>
          </div>
        </div>
      </div>
    
  </section>

</asp:Content>
