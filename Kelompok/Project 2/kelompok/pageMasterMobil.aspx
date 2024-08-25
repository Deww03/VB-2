<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pageMasterMobil.aspx.vb" Inherits="kelompok.pageMasterMobil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>TUGAS KELOMPOK VB</title>
    <link href="MyStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            font-family: "Courier New";
            font-size: small;
            color: #FFFFFF;
        }

    </style>

</head>
<body style="background-color:#ffa583">
    <form id="form1" runat="server">
            <div style="width:800px; height:610px; margin:auto; background:#999999; padding-top:10px; border:1px;  " >
            <div style="width:780px; height:125px; margin:auto; background:white; padding-top:5px;  "  >
                <div style ="width:770px; height:110px; background:gray; margin:auto;  padding-top:0px; padding-bottom:0px;">
                    <img src="logo.png" width="770" height ="120" alt =""/>
                </div>                
            </div>
            <div style ="width:780px; height:415px; margin:auto; background:#999999; margin-top:5px; padding-bottom :5px; " >
                <div style="width:230px; height:415px; float:left; background:white; "  >
                    <div style ="width:215px; height:395px; background:#333333; margin:auto; padding-left:5px; padding-top:5px; padding-bottom:5px; margin-top:5px;">
                        <div class="StyleMenu">
                            <h3 class="HeaderBar">MAIN MENU</h3>
                            <ul>
                               <li><a href="pageMainMenu.aspx">HOME</a></li>
                                <li><a href="pageMasterMobil.aspx">MASTER MOBIL</a></li>
                                <li><a href="pageTambahMobil.aspx">TAMBAH MOBIL</a></li>
                                <li><a href="pagePeminjamanMobil.aspx">PEMINJAMAN MOBIL</a></li>
                                <li><a href="pagePengembalianMobil.aspx">PENGEMBALIAN MOBIL</a></li>
                                <li><a href="pageSisaMobil.aspx">MOBIL YANG TERSEDIA</a></li>
                                <li><a href="pageLogin.aspx">LOGOUT</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div style ="width:545px; height:412px; float:right; background:white;" >
                    <div style =" width:515px; height:20px; background:silver; margin:auto; padding-right :10px; padding-left:10px;  padding-top:5px; padding-bottom:5px; margin-top:5px;">
                        <table align="center" >
                            <tr align="center" valign="middle">
                                <td  align="center" valign="middle">OLAH DATA MASTER MOBIL</td>
                            </tr>
                        </table>
                    </div>
                    <div style =" width:525px; height:174px; background:silver; padding-right :10px; padding-left:0px;  padding-top:5px; padding-bottom:5px; margin-top:5px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
                        <table>
                            <tr>
                                <td  style="width:180px;">KODE MOBIL</td>
                                <td>
                                    <asp:TextBox ID="txtKodeMobil" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:180px;">NAMA MOBIL</td>
                                <td>
                                    <asp:TextBox ID="txtNamaMobil" runat="server" Width="330px"></asp:TextBox>
                                </td>
                            </tr>                    
                            <tr>
                                <td style="width:180px;">WARNA</td>
                                <td>
                                    <asp:TextBox ID="txtWarna" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:180px;">KONDISI</td>
                                <td>
                                    <asp:TextBox ID="txtKondisi" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>                    
                            <tr>
                                <td style="width:180px;">HARGA SEWA</td>
                                <td>
                                    <asp:TextBox ID="txtHargaSewa" runat="server" Width="100px" ></asp:TextBox>
                                </td>
                            </tr>                
                                
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnSave" Width="80px" runat="server" Text="Save" />
                                    <asp:Button ID="btnUpdate" Width="80px" runat="server" Text="Update" />
                                    <asp:Button ID="btnDelete" Width="80px" runat="server" Text="Delete" />
                                    <asp:Button ID="btnClear" Width="80px" runat="server" Text="Clear" />
                                </td>
                            </tr> 
                        </table>                                                          
                    </div>
                    <div style =" width:525px; height:175px; background:silver; padding-right :5px; padding-left:5px;  margin-top:3px; padding-top:5px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
                        <div style =" width:520px; height:139px; background:white; margin:32px auto auto auto; overflow:auto;  ">
                            <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false"
                            ShowFooter ="false" Width ="600px" style="margin-top: 0px" >
                            <Columns >
                                <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
                                    <ControlStyle ForeColor ="Blue" />
                                </asp:CommandField>
                                <asp:BoundField DataField ="KD_MOBIL" HeaderText ="KODE MOBIL" ItemStyle-Width ="40px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="NM_MOBIL" HeaderText ="NAMA MOBIL" ItemStyle-Width ="250px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="WARNA" HeaderText ="WARNA" ItemStyle-Width ="100px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="KONDISI" HeaderText ="KONDISI" ItemStyle-Width ="100px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="HRG_SEWA" HeaderText ="HARGA SEWA" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N2}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                            </Columns>
                        </asp:GridView>   
                        </div>
                                             
                    </div>
                </div>   
            </div>
            
            <div style="width:780px; height:40px; margin:auto; background:white; padding-top:5px;" class="style1"  >
                <div style ="width:770px; height:30px; background:#333333; margin:auto; padding-bottom:5px;" >                
                    <span class="style2">Copyrights by UNIPI - TANGERANGG</span><br class="style2" />
                    <span class="style2"><span class="style2">&copy; 2023 All Rights Reserved</span></span><span class="style2"> </span>
                </div>
            </div>
        </div> 

    </form>
</body>
</html>