<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section>
      <img src="imgs/home-bg.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Fitur Kami</h2>
                  <p><b>3 Fitur Utama Kami</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/digital-inventory.png"/>
                  <h4>Inventaris Buku Digital</h4>
                  <p class="text-justify">Catatan atau daftar yang terorganisir dari semua buku digital yang dimiliki oleh suatu perpustakaan.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/search-online.png"/>
                  <h4>Mencari Buku</h4>
                  <p class="text-justify">Langkah-langkah yang dilakukan untuk menemukan buku tertentu dalam koleksi perpustakaan digital.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/defaulters-list.png"/>
                  <h4>Defaulter List</h4>
                  <p class="text-justify">Daftar individu yang tidak memenuhi kewajiban mereka.</p>
               </center>
            </div>
         </div>
      </div>
   </section>
   <section>
      <img src="imgs/in-homepage-banner.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Proses Kami</h2>
                  <p><b>Kami Memiliki 3 Langkah Sederhana</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/sign-up.png" />
                  <h4>Daftar</h4>
                  <p class="text-justify">Proses dan prosedur yang harus diikuti oleh seseorang untuk mendaftar dalam suatu layanan perpustakaan.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/search-online.png"/>
                  <h4>Mencari Buku</h4>
                  <p class="text-justify">Langkah-langkah yang dilakukan untuk menemukan buku tertentu dalam koleksi perpustakaan digital.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/library.png"/>
                  <h4>Kunjungi Kami</h4>
                  <p class="text-justify">Kunjungi Website kami di E-Library untuk dapat meminjam buku</p>
               </center>
            </div>
         </div>
      </div>
   </section>
</asp:Content>