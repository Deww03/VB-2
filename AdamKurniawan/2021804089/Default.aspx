A" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="_2021804089._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <%-- Adam Kurniawan
           2021804089   --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Test Adam</title>
<style type="text/css">
        .style11
    {
        width: 141px;
        height: 81px;
    }
    .style17
    {
        height: 81px;
        width: 179px;
    }
    .style25
    {
        height: 26px;
    }
    .style28
    {
        width: 141px;
        height: 18px;
    }
    .style29
    {
        height: 18px;
        width: 179px;
    }
    .style30
    {
        height: 18px;
    }
    .style33
    {
        width: 141px;
        height: 7px;
    }
    .style34
    {
        height: 7px;
        width: 179px;
    }
    .style35
    {
        height: 7px;
    }
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
    .style43
    {
        width: 149px;
        height: 26px;
    }
    .style44
    {
        width: 149px;
        height: 18px;
    }
    .style45
    {
        width: 149px;
        height: 7px;
    }
    .style46
    {
        width: 149px;
        height: 6px;
    }
    .style48
    {
        height: 26px;
        width: 94px;
    }
    .style49
    {
        height: 18px;
        width: 94px;
    }
    .style50
    {
        height: 7px;
        width: 94px;
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
    </style>
</head>
<body>
    <%-- Adam Kurniawan
           2021804089   --%>
    <form id="form1" runat="server">
    <div style=" width:793px; height:558px; margin:auto; background:gray; padding-top:10px;">
        <div style=" width:730px; height:104px; margin:auto; background:white; padding-left:10px; padding-top:10px;">
            &nbsp;<img src="logo.png" style="width: 712px; height: 96px" alt="" /></div>    
    
        <div style=" width:730px; height:45px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:label ID="Label1" runat="server" Text="SOAL TUGAS" Font-Bold="true" Font-Size="X-Large" ></asp:label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:730px; height:285px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="height: 280px; width: 721px">
                <tr>
                    <td class="style52">No Pemesanan</td>
                    <td colspan="4" class="style53">
                        <asp:TextBox ID="txtNo" runat="server" Width="139px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style54">
                        <asp:Button ID="btnHitung" runat="server" Text="Calculate" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td class="style55">Nama Pemesanan</td>
                    <td colspan="4" class="style56">
                        <asp:TextBox ID="txtNama" runat="server" Width="388px"></asp:TextBox>
                    </td>
                    <td colspan="2" style="text-align:right;" class="style57">
                        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td class="style11" rowspan="3">Jurusan</td>
                    <td class="style17" rowspan="3">
                        <asp:RadioButtonList ID="optJurusan" runat="server" RepeatDirection="Vertical" AutoPostBack="true">
                            <asp:ListItem Text="Jogjakarta" Value="J"></asp:ListItem>
                            <asp:ListItem Text="Surabaya" Value="S"></asp:ListItem>
                            <asp:ListItem Text="Malang" Value="M"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style25"></td>
                    <td class="style25"></td>
                    <td class="style43">Keberangkatan</td>
                    <td class="style48">
                        <asp:RadioButtonList ID="optBerangkat" runat="server" 
                            RepeatDirection="Horizontal" AutoPostBack="true" style="margin-left: 0px" 
                            Width="164px">
                            <asp:ListItem Text="Pagi" Value="P"></asp:ListItem>
                            <asp:ListItem Text="Malam" Value="M"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style25"></td>
                    <td class="style25"></td> 
                    <td class="style43">Harga Tiket</td>
                    <td class="style48">
                        <asp:TextBox ID="txtHarga" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style25"></td>
                    <td class="style25"></td> 
                    <td class="style43">Jumlah Tiket</td>
                    <td class="style48">
                        <asp:TextBox ID="txtJumlah" runat="server"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style28"></td>
                    <td class="style29"></td>
                    <td class="style30"></td>
                    <td class="style30"></td> 
                    <td class="style44">Ppn</td>
                    <td class="style49">
                        <asp:TextBox ID="txtPpn" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style33"></td>
                    <td class="style34"></td>
                    <td class="style35"></td>
                    <td class="style35"></td> 
                    <td class="style45">Discount</td>
                    <td class="style50">
                        <asp:TextBox ID="txtDiscount" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td class="style38"></td>
                    <td class="style39"></td>
                    <td class="style40"></td>
                    <td class="style40"></td> 
                    <td class="style46">Total Harga</td>
                    <td class="style51">
                        <asp:TextBox ID="txtTotal" ReadOnly="true" runat="server" BackColor="#CCCCCC"></asp:TextBox>
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
                    <td class="style61">ADAM KURNIAWAN</t
                    d>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>

