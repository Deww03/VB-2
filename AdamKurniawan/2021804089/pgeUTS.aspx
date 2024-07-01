<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pgeUTS.aspx.vb" Inherits="_2021804089.pgeUTS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>UTS Adam</title>
<style type="text/css">
        .style38
    {
        width: 141px;
        height: 6px;
    }
    .style39
    {
        height: 6px;
        width: 179px;
    }
    .style40
    {
        height: 6px;
    }
    .style46
    {
        width: 149px;
        height: 6px;
    }
    .style51
    {
        height: 6px;
        width: 94px;
    }
    .style52
    {
        width: 141px;
        height: 28px;
    }
    .style53
    {
        height: 28px;
    }
    .style54
    {
        width: 94px;
        height: 28px;
    }
    .style55
    {
        width: 141px;
        height: 21px;
    }
    .style56
    {
        height: 21px;
    }
    .style57
    {
        height: 21px;
        width: 94px;
    }
    .style58
    {
        width: 264px;
        height: 20px;
    }
    .style61
    {
        height: 6px;
        width: 191px;
    }
    .style65
    {
        height: 6px;
        width: 82px;
    }
    .style66
    {
        height: 6px;
        width: 197px;
    }
    .style77
    {
        width: 141px;
        height: 29px;
    }
    .style78
    {
        height: 29px;
        width: 179px;
    }
    .style79
    {
        height: 29px;
    }
    .style80
    {
        width: 149px;
        height: 29px;
    }
    .style81
    {
        height: 29px;
        width: 94px;
    }
    .style82
    {
        height: 11px;
        width: 179px;
    }
    .style83
    {
        width: 149px;
        height: 11px;
    }
    .style84
    {
        width: 141px;
        height: 11px;
    }
    .style85
    {
        height: 11px;
    }
    .style86
    {
        height: 11px;
        width: 94px;
    }
    .style87
    {
        width: 141px;
        height: 7px;
    }
    .style88
    {
        height: 7px;
        width: 179px;
    }
    .style89
    {
        height: 7px;
    }
    .style90
    {
        width: 149px;
        height: 7px;
    }
    .style91
    {
        height: 7px;
        width: 94px;
    }
    </style>
</head>
<body>
    <%-- Adam Kurniawan
           2021804089   --%>
    <form id="form1" runat="server">
    <div style=" width:793px; height:482px; margin:auto; background:gray; padding-top:10px;">
        <div style=" width:730px; height:104px; margin:auto; background:white; padding-left:10px; padding-top:10px;">
            &nbsp;<img src="logo.png" style="width: 712px; height: 96px" alt="" /></div>    
    
        <div style=" width:730px; height:45px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:label ID="Label1" runat="server" Text="SOAL UTS" Font-Bold="true" Font-Size="X-Large" ></asp:label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:730px; height:215px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="height: 205px; width: 721px">
                <tr>
                    <td class="style52">No Anggota</td>
                    <td colspan="4" class="style53">
                        <asp:TextBox ID="txtNo" runat="server" Width="139px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style54">
                    </td>
                </tr>
                <tr>
                    <td class="style55">Nama Anggota</td>
                    <td colspan="4" class="style56">
                        <asp:TextBox ID="txtNama" runat="server" Width="388px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style57">

                    </td>
                </tr>
                <tr>
                    <td class="style84">Jenis Pinjaman</td>
                    <td class="style82">
                        <asp:RadioButtonList ID="optPinjaman" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                            <asp:ListItem Text="Tunai" Value="T"></asp:ListItem>
                            <asp:ListItem Text="Barang" Value="B"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style85"></td>
                    <td class="style85"></td>
                    <td class="style83">Besar Pinjaman</td>
                    <td class="style86">
                        <asp:TextBox ID="txtPinjaman" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style87">Bunga Pinjaman</td>
                    <td class="style88">
                        <asp:TextBox ID="txtBungaPinjaman" ReadOnly="true" runat="server" BackColor="#CCCCCC" Width="101px"></asp:TextBox> %
                    </td>
                    <td class="style89"></td>
                    <td class="style89"></td> 
                    <td class="style90">Besar Bunga</td>
                    <td class="style91">
                        <asp:TextBox ID="txtBunga" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style77">Durasi</td>
                    <td class="style78">
                        <asp:TextBox ID="txtDurasi" runat="server" Width="101px"></asp:TextBox> X
                    </td>
                    <td class="style79"></td>
                    <td class="style79"></td> 
                    <td class="style80">Cicilan/Bulan</td>
                    <td class="style81">
                        <asp:TextBox ID="txtCicilan" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style38">Pinjaman + Bunga</td>
                    <td class="style39">
                        <asp:TextBox ID="txtPinjamanBunga" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    </td>
                    <td class="style40"></td>
                    <td class="style40"></td> 
                    <td class="style46" style="text-align:right;">
                       <asp:Button ID="btnHitung" runat="server" Text="Hitung" Width="80px" />
                    </td>
                    <td class="style51">
                       <asp:Button ID="btnClear" runat="server" Text="Batal" Width="80px" />
                    </td>                   
                </tr>
            </table>
        </div>
        <div style=" width:730px; height:37px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table>
                <tr>
                    <td class="style58">NPM : 2021804089</td>
                    <td class="style66"></td>
                    <td class="style65" style="text-align:right;">NAMA : </td>
                    <td class="style61">ADAM KURNIAWAN</td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
