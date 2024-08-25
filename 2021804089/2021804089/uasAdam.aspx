<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="uasAdam.aspx.vb" Inherits="_2021804089._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>UAS Adam</title>
<style type="text/css">
        .style46
    {
        width: 148px;
        height: 6px;
    }
    .style53
    {
        height: 28px;
    }
    .style56
    {
        height: 21px;
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
    .style84
    {
        width: 141px;
        height: 11px;
    }
    .style85
    {
        height: 11px;
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
    .style97
    {
        height: 48px;
    }
    .style98
    {
        width: 254px;
        height: 28px;
    }
    .style99
    {
        width: 254px;
        height: 48px;
    }
    .style100
    {
        width: 254px;
        height: 21px;
    }
    .style101
    {
        height: 11px;
        width: 254px;
    }
    .style102
    {
        height: 7px;
        width: 254px;
    }
    .style103
    {
        height: 29px;
        width: 254px;
    }
    .style113
    {
        width: 463px;
        height: 28px;
    }
    .style114
    {
        width: 463px;
        height: 48px;
    }
    .style115
    {
        width: 463px;
        height: 21px;
    }
    .style116
    {
        height: 11px;
        width: 463px;
    }
    .style117
    {
        height: 7px;
        width: 463px;
    }
    .style118
    {
        height: 29px;
        width: 463px;
    }
    .style119
    {
        height: 6px;
        width: 463px;
    }
    .style120
    {
        width: 7px;
        height: 7px;
    }
    .style121
    {
        width: 7px;
        height: 29px;
    }
    .style122
    {
        width: 7px;
        height: 6px;
    }
    .style123
    {
        width: 7px;
        height: 11px;
    }
    .style124
    {
        height: 11px;
        width: 148px;
    }
    .style125
    {
        height: 7px;
        width: 148px;
    }
    .style126
    {
        height: 29px;
        width: 148px;
    }
    </style>
</head>
<body>
    <%-- Adam Kurniawan
           2021804089   --%>
    <form id="form1" runat="server">
    <div style=" width:1075px; height:514px; margin:auto; background:gray; padding-top:10px;">
        <div style=" width:1006px; height:104px; margin:auto; background:white; padding-left:10px; padding-top:10px;">
            &nbsp;<img src="logo.png" style="width: 992px; height: 96px" alt="" /></div>    
    
        <div style=" width:1006px; height:45px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:label ID="Label1" runat="server" Text="SOAL UAS" Font-Bold="true" Font-Size="X-Large" ></asp:label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:1004px; height:291px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="height: 263px; width: 988px">
                <tr>
                    <td class="style113">No Kendaraan</td>
                    <td colspan="4" class="style53">
                        <asp:TextBox ID="txtNo" runat="server" Width="139px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style98">
                    </td>
                </tr>
                <tr>
                    <td class="style114">Pemilik Kendaraan</td>
                    <td colspan="4" class="style97">
                        <asp:TextBox ID="txtPemilik" runat="server" Width="484px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style99">
                    </td>
                </tr>
                <tr>
                    <td class="style115">Nama Kendaraan</td>
                    <td colspan="4" class="style56">
                        <asp:TextBox ID="txtNama" runat="server" Width="491px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style100">

                    </td>
                </tr>
                <tr>
                    <td class="style115">Nomor Rangka</td>
                    <td colspan="4" class="style56">
                        <asp:TextBox ID="txtRangka" runat="server" Width="490px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style100">

                    </td>
                </tr>
                <tr>
                    <td class="style116">Warna Kendaraan</td>
                    <td class="style124">
                        <asp:TextBox ID="txtWarna" runat="server"></asp:TextBox>
                    </td>
                    <td class="style123"></td>
                    <td class="style85"></td>                
                    <td class="style84">Jenis Kendaraan</td>
                    <td class="style101">
                        <asp:RadioButtonList ID="optJenis" runat="server" RepeatDirection="Horizontal" 
                            AutoPostBack="true" Width="240px">
                            <asp:ListItem Text="Roda Dua" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Roda Empat" Value="E"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style117">Tahun Kendaraan</td>
                    <td class="style125">
                        <asp:TextBox ID="txtTahun" runat="server" Width="101px"></asp:TextBox>
                    </td>
                    <td class="style120"></td>
                    <td class="style89"></td> 
                    <td class="style90">Harga Jual</td>
                    <td class="style102">
                        <asp:TextBox ID="txtJual" runat="server"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style118">PPn</td>
                    <td class="style126">
                        <asp:TextBox ID="txtPPn" runat="server" Width="101px"></asp:TextBox> %
                    </td>
                    <td class="style121"></td>
                    <td class="style79"></td> 
                    <td class="style80">Total Harga</td>
                    <td class="style103">
                        <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style119" style="text-align:right;">
                       <asp:Button ID="btnHitung" runat="server" Text="Hitung" Width="80px" />
                    </td>
                    <td class="style46" style="text-align:right;">
                       <asp:Button ID="btnSimpan" runat="server" Text="Simpan" Width="80px" />
                    </td>
                    <td class="style122">
                       <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px" />
                    </td>                   
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
